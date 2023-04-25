class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :recoverable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  belongs_to :office, optional: true

  has_many :user_devices, dependent: :destroy

  after_update :send_mail_office_change

  enum status: {employee: 0, resigned: 1}
  enum role: {staff: 0, system_admin: 1, bod: 2, device_manager: 3, direct_manager: 4}

  scope :without_office, ->{where office_id: nil}
  scope :without_users, ->(ids){where.not id: ids}

  def fullname
    "#{last_name} #{first_name}"
  end

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        password = Devise.friendly_token[0, 20]
        info = auth.info
        user.email = info.email
        user.password = password
        user.first_name = info.first_name
        user.last_name = info.last_name
        user.avatar = info.image
        send_mail_provide_password info.email, password
      end
    end

    def send_mail_provide_password email, password
      Users::Mailer.provide_password(email, password).deliver_later
    end
  end

  private

  def send_mail_office_change
    Users::Mailer.office_change(self).deliver_later
  end
end
