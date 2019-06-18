# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :linked_files, %w{ config/secrets.yml }

set :application, 'freemarket_sample_45'
set :repo_url,  'git@github.com:SuguruSasuo0906/freemarket_sample_45.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/freemarket-sample-45.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
  RECAPTCHA_SITE_KEY: ENV['RECAPTCHA_SITE_KEY'],
  RECAPTCHA_SECRET_KEY:ENV['RECAPTCHA_SECRET_KEY'],
  FACEBOOK_KEY:ENV['FACEBOOK_KEY'],
  FACEBOOK_SECRET:ENV['FACEBOOK_SECRET'],
  GOOGLE_CLIENT_ID:ENV['GOOGLE_CLIENT_ID'],
  GOOGLE_CLIENT_SECRET:ENV['GOOGLE_CLIENT_SECRET'],
  TWILIO_NUMBER:ENV['TWILIO_NUMBER'],
  TWILIO_SID:ENV['TWILIO_SID'],
  TWILIO_TOKEN:ENV['TWILIO_TOKEN'],
  PAYJP_PRIVATE_KEY:ENV["PAYJP_PRIVATE_KEY"],
  BASIC_AUTH_USER:ENV["BASIC_AUTH_USER"],
  BASIC_AUTH_PASSWORD:ENV["BASIC_AUTH_PASSWORD"]
}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload secrets.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end