require 'devise-async'
Devise::Async.backend = :que
Devise::Async.queue = ENV['QUEUE_NAME']
# Devise::Async.enabled = true
