require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(assets: %w(development test)))
end

module Track
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'

    config.i18n.enforce_available_locales = true

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    config.active_record.whitelist_attributes = true

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.assets.initialize_on_precompile = false
  end
end
