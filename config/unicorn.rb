# Set the working application directory
# working_directory "/path/to/your/app"
app_dir = File.expand_path('../..', __FILE__)
tmp_dir = "#{app_dir}/tmp"
working_directory app_dir

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{tmp_dir}/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "#{app_dir}/log/unicorn.log"
stdout_path "#{app_dir}/log/unicorn.log"

# Unicorn socket
listen "#{tmp_dir}/sockets/unicorn.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
