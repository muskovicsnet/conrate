Rails.application.config.to_prepare do
  ::ApplicationController.class_eval do
    theme Settings['conratethemes.theme'] if Settings.table_exists?
  end
end
