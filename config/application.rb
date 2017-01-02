require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StarsReminder
  class Application < Rails::Application
    env_file = File.join(Rails.root, 'config', 'local_env.yml')
    YAML.load(File.open(env_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(env_file)
  end
end
