require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # 以下を追加すれば日本語に
    config.i18n.default_locale = :ja
    # タイムゾーンも変更するなら，以下を追加
    config.time_zone = 'Asia/Tokyo'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.test_framework :rspec,
        # falseはテストデータベースにレコードを作成するファイルの作成をスキップしている。
        fixtures: false,
        # falseはビュースペックを作成しないことを指定している。
        view_specs: false,
        # falseはヘルパーファイル用のスペックを作成しないことを指定している。
        helper_specs: false,
        # falseはconfig/routes.rb用のスペックファイルの作成を省略している。
        routing_specs: false
    end
  end
end
