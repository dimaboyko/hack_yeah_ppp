# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "vatman_ppp"

set :repo_url, "git@github.com:dimaboyko/hack_yeah_ppp.git"

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, "/srv/rake_apps/#{fetch(:application)}"

set :branch, -> { ENV["BRANCH"] || 'master' }

set :user, 'ubuntu'

set :linked_dirs, %w{config/a9n config/unicorn log tmp/pids tmp/sockets}

set :environment, 'production'

set :forward_agent, true

set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
