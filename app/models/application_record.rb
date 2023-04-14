class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :recent, ->{order created_at: :desc}
  scope :by_ids, ->(ids){where id: ids}

  class << self
    def human_enum_name enum_name, enum_value
      enum_i18n_key = enum_name.to_s.pluralize
      I18n.t "activerecord.attributes.#{model_name.i18n_key}.#{enum_i18n_key}.#{enum_value}"
    end
  end
end
