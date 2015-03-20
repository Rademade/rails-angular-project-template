lock '3.2.1'

set :application, ''

set :deploy_to, ''

set :scm, :git
set :repo_url, ''

# setup rvm.
set :rvm_type,          :system
set :rvm_ruby_version,  'ruby-2.1.5@gemset'

# how many old releases do we want to keep, not much
set :keep_releases, 5

# files we want symlinking to specific entries in shared
set :linked_files, %w{
  config/database.yml
  config/mongoid.yml
  config/secrets.yml
}

# dirs we want symlinking to shared
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(mongoid.yml secrets.yml database.yml))

# HipChat settings
#
set :hipchat_token,         ENV['HIPCHAT_AUTH_TOKEN']
set :hipchat_room_name,     '379396'
set :hipchat_announce,      false
set :hipchat_color,         'yellow'
set :hipchat_success_color, 'green'


namespace :deploy do

  desc 'Download bower components for admin panel'
  task 'admin:bower:install' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'rademade_admin:bower:install'
        end
      end
    end
  end

  desc 'Download bower components for public web site'
  task 'bower:install' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'bower:install'
        end
      end
    end
  end

  desc 'Export i18n js'
  task 'i18n:js:export' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'i18n:js:export'
        end
      end
    end
  end

  desc 'Restart application'
  after :restart, :restart_passenger do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

  namespace :assets do
    before :backup_manifest, 'deploy:assets:create_manifest_json'
    task :create_manifest_json do
      on roles :web do
        within release_path do
          execute :mkdir, release_path.join('assets_manifest_backup')
        end
      end
    end
  end

  before 'deploy:assets:precompile', 'deploy:i18n:js:export'
  before 'deploy:assets:precompile', 'deploy:admin:bower:install'
  before 'deploy:assets:precompile', 'deploy:bower:install'
  after :finishing, 'deploy:restart_passenger'
  after :finishing, 'deploy:cleanup'
end
