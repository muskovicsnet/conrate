# require 'devise/async/backend/que'
#
# module Devise
#   module Async
#     module Backend
#       class Que < Base
#         class Job < ::Que::Job
#           @queue = :conrate
#         end
#       end
#     end
#   end
# end

#Devise::Async.setup do |config|
#  config.backend = :que
#  config.queue   = :conrate
#end
class ActionMailer::DeliveryJob
  queue_as ENV['QUEUE_NAME']
end
