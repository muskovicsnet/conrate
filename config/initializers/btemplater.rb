module Btemplater
  class Engine < Rails::Engine
    config.current_user_entity = ->(env) { env.current_user }
  end
end
