require 'raven'

if Rails.env.production?
  Raven.configure do |config|
    config.dsn = TRAVELConfig.SENTRY_DSN
      #config.action_dispatch.show_exceptions = false
  end
end