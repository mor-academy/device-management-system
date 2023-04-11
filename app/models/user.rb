class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  belongs_to :office, optional: true

  enum status: {employee: 0, resigned: 1}
  enum role: {staff: 0, system_admin: 1, bod: 2, device_manager: 3, direct_manager: 4}

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.avatar = auth.info.image
      end
    end
  end
end
