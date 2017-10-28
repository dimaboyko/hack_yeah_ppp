require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module HackYeahPpp
  class Application < Rails::Application
    config.load_defaults 5.1

    A9n.root = File.expand_path('../..', __FILE__)
    A9n.load

    config.i18n.default_locale = :en

    Dir[Rails.root.join('lib', '*.rb')].each { |file| require file }
    Dir[Rails.root.join('lib', '{controller,extensions}', '**', '*.rb')].each { |file| require file }
  end
end
