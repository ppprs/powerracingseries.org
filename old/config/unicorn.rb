worker_processes 2
timeout 30
preload_app true

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection 
  end
end
