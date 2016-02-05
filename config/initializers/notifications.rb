module Notifications
  class Engine < Rails::Engine
    config.notifications_recipient_class = Conratesecurity::User
    config.messages_recipient_class = Conratesecurity::User
    config.reports_recipient_class = Conratesecurity::User

    config.reports_recipient_decorator = proc do |f, c|
      f.input c.name, collection: Notifications::Engine.config.reports_recipient_class.all.map { |u| [u.pretty_name, u.id] }
    end
    config.messages_recipient_decorator = proc do |f, c|
      f.input c.name, collection: Notifications::Engine.config.reports_recipient_class.all.map { |u| [u.pretty_name, u.id] }
    end

    config.current_user_entity = ->(env) { env.current_user }
  end
end
