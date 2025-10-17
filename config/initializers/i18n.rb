Rails.application.config.after_initialize do
  I18n.default_locale = :ru
  I18n.locale = :ru
end
