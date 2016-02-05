daemonize false
threads 1, 2
workers 2
port 3000

preload_app!

on_worker_boot do
  ::ActiveRecord::Base.establish_connection

  Que.mode = :async
  Que::Worker.workers.push Que::Worker.new ENV['QUEUE_NAME']
  #Que::Worker.workers.push Que::Worker.new 'mailer'
# end
end

worker_timeout 60
worker_boot_timeout 60
