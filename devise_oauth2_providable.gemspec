# -*- encoding: utf-8 -*-
# stub: devise_oauth2_providable 1.2.10 ruby lib
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise/oauth2_providable/version"


Gem::Specification.new do |s|
  s.name = "devise_oauth2_providable".freeze
  s.version = Devise::Oauth2Providable::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Sonnek".freeze]
  s.date = "2019-05-16"
  s.description = "Rails3 engine that adds OAuth2 Provider support to any application built with Devise authentication".freeze
  s.email = ["ryan@socialcast.com".freeze]
  s.files = [".gitignore".freeze, ".ruby_gemset".freeze, ".ruby_version".freeze, "CONTRIBUTORS.txt".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/controllers/devise/oauth2_providable/authorizations_controller.rb".freeze, "app/controllers/devise/oauth2_providable/tokens_controller.rb".freeze, "app/models/devise/oauth2_providable/access_token.rb".freeze, "app/models/devise/oauth2_providable/authorization_code.rb".freeze, "app/models/devise/oauth2_providable/client.rb".freeze, "app/models/devise/oauth2_providable/refresh_token.rb".freeze, "app/views/devise/oauth2_providable/authorizations/_form.html.erb".freeze, "app/views/devise/oauth2_providable/authorizations/error.html.erb".freeze, "app/views/devise/oauth2_providable/authorizations/new.html.erb".freeze, "config/locales/en.yml".freeze, "config/routes.rb".freeze, "db/migrate/20111014160714_create_devise_oauth2_providable_schema.rb".freeze, "devise_oauth2_providable.gemspec".freeze, "lib/devise/oauth2_providable/engine.rb".freeze, "lib/devise/oauth2_providable/expirable_token.rb".freeze, "lib/devise/oauth2_providable/models/oauth2_authorization_code_grantable.rb".freeze, "lib/devise/oauth2_providable/models/oauth2_password_grantable.rb".freeze, "lib/devise/oauth2_providable/models/oauth2_providable.rb".freeze, "lib/devise/oauth2_providable/models/oauth2_refresh_token_grantable.rb".freeze, "lib/devise/oauth2_providable/strategies/oauth2_authorization_code_grant_type_strategy.rb".freeze, "lib/devise/oauth2_providable/strategies/oauth2_grant_type_strategy.rb".freeze, "lib/devise/oauth2_providable/strategies/oauth2_password_grant_type_strategy.rb".freeze, "lib/devise/oauth2_providable/strategies/oauth2_providable_strategy.rb".freeze, "lib/devise/oauth2_providable/strategies/oauth2_refresh_token_grant_type_strategy.rb".freeze, "lib/devise/oauth2_providable/version.rb".freeze, "lib/devise_oauth2_providable.rb".freeze, "script/rails".freeze, "spec/controllers/authorizations_controller_spec.rb".freeze, "spec/controllers/protected_controller_spec.rb".freeze, "spec/controllers/tokens_controller_spec.rb".freeze, "spec/dummy/Rakefile".freeze, "spec/dummy/app/assets/javascripts/application.js".freeze, "spec/dummy/app/assets/stylesheets/application.css".freeze, "spec/dummy/app/controllers/application_controller.rb".freeze, "spec/dummy/app/controllers/protected_controller.rb".freeze, "spec/dummy/app/helpers/application_helper.rb".freeze, "spec/dummy/app/mailers/.gitkeep".freeze, "spec/dummy/app/models/.gitkeep".freeze, "spec/dummy/app/models/user.rb".freeze, "spec/dummy/app/views/layouts/application.html.erb".freeze, "spec/dummy/config.ru".freeze, "spec/dummy/config/application.rb".freeze, "spec/dummy/config/boot.rb".freeze, "spec/dummy/config/database.yml".freeze, "spec/dummy/config/environment.rb".freeze, "spec/dummy/config/environments/development.rb".freeze, "spec/dummy/config/environments/production.rb".freeze, "spec/dummy/config/environments/test.rb".freeze, "spec/dummy/config/initializers/backtrace_silencers.rb".freeze, "spec/dummy/config/initializers/devise.rb".freeze, "spec/dummy/config/initializers/inflections.rb".freeze, "spec/dummy/config/initializers/mime_types.rb".freeze, "spec/dummy/config/initializers/secret_token.rb".freeze, "spec/dummy/config/initializers/session_store.rb".freeze, "spec/dummy/config/initializers/wrap_parameters.rb".freeze, "spec/dummy/config/locales/devise.en.yml".freeze, "spec/dummy/config/locales/en.yml".freeze, "spec/dummy/config/routes.rb".freeze, "spec/dummy/db/migrate/20111014142838_create_users.rb".freeze, "spec/dummy/db/migrate/20111014161437_create_devise_oauth2_providable_schema.rb".freeze, "spec/dummy/db/schema.rb".freeze, "spec/dummy/lib/assets/.gitkeep".freeze, "spec/dummy/log/.gitkeep".freeze, "spec/dummy/public/404.html".freeze, "spec/dummy/public/422.html".freeze, "spec/dummy/public/500.html".freeze, "spec/dummy/public/favicon.ico".freeze, "spec/dummy/script/rails".freeze, "spec/factories/client_factory.rb".freeze, "spec/factories/user_factory.rb".freeze, "spec/integration/oauth2_authorization_token_grant_type_strategy_spec.rb".freeze, "spec/integration/oauth2_password_grant_type_strategy_spec.rb".freeze, "spec/integration/oauth2_refresh_token_grant_type_strategy_spec.rb".freeze, "spec/lib/devise_oauth2_providable_spec.rb".freeze, "spec/models/access_token_spec.rb".freeze, "spec/models/authorization_code_spec.rb".freeze, "spec/models/client_spec.rb".freeze, "spec/models/refresh_token_spec.rb".freeze, "spec/models/user_spec.rb".freeze, "spec/routing/authorizations_routing_spec.rb".freeze, "spec/routing/tokens_routing_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/match_json.rb".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "OAuth2 Provider for Rails applications".freeze
  s.test_files = ["spec/controllers/authorizations_controller_spec.rb".freeze, "spec/controllers/protected_controller_spec.rb".freeze, "spec/controllers/tokens_controller_spec.rb".freeze, "spec/dummy/Rakefile".freeze, "spec/dummy/app/assets/javascripts/application.js".freeze, "spec/dummy/app/assets/stylesheets/application.css".freeze, "spec/dummy/app/controllers/application_controller.rb".freeze, "spec/dummy/app/controllers/protected_controller.rb".freeze, "spec/dummy/app/helpers/application_helper.rb".freeze, "spec/dummy/app/mailers/.gitkeep".freeze, "spec/dummy/app/models/.gitkeep".freeze, "spec/dummy/app/models/user.rb".freeze, "spec/dummy/app/views/layouts/application.html.erb".freeze, "spec/dummy/config.ru".freeze, "spec/dummy/config/application.rb".freeze, "spec/dummy/config/boot.rb".freeze, "spec/dummy/config/database.yml".freeze, "spec/dummy/config/environment.rb".freeze, "spec/dummy/config/environments/development.rb".freeze, "spec/dummy/config/environments/production.rb".freeze, "spec/dummy/config/environments/test.rb".freeze, "spec/dummy/config/initializers/backtrace_silencers.rb".freeze, "spec/dummy/config/initializers/devise.rb".freeze, "spec/dummy/config/initializers/inflections.rb".freeze, "spec/dummy/config/initializers/mime_types.rb".freeze, "spec/dummy/config/initializers/secret_token.rb".freeze, "spec/dummy/config/initializers/session_store.rb".freeze, "spec/dummy/config/initializers/wrap_parameters.rb".freeze, "spec/dummy/config/locales/devise.en.yml".freeze, "spec/dummy/config/locales/en.yml".freeze, "spec/dummy/config/routes.rb".freeze, "spec/dummy/db/migrate/20111014142838_create_users.rb".freeze, "spec/dummy/db/migrate/20111014161437_create_devise_oauth2_providable_schema.rb".freeze, "spec/dummy/db/schema.rb".freeze, "spec/dummy/lib/assets/.gitkeep".freeze, "spec/dummy/log/.gitkeep".freeze, "spec/dummy/public/404.html".freeze, "spec/dummy/public/422.html".freeze, "spec/dummy/public/500.html".freeze, "spec/dummy/public/favicon.ico".freeze, "spec/dummy/script/rails".freeze, "spec/factories/client_factory.rb".freeze, "spec/factories/user_factory.rb".freeze, "spec/integration/oauth2_authorization_token_grant_type_strategy_spec.rb".freeze, "spec/integration/oauth2_password_grant_type_strategy_spec.rb".freeze, "spec/integration/oauth2_refresh_token_grant_type_strategy_spec.rb".freeze, "spec/lib/devise_oauth2_providable_spec.rb".freeze, "spec/models/access_token_spec.rb".freeze, "spec/models/authorization_code_spec.rb".freeze, "spec/models/client_spec.rb".freeze, "spec/models/refresh_token_spec.rb".freeze, "spec/models/user_spec.rb".freeze, "spec/routing/authorizations_routing_spec.rb".freeze, "spec/routing/tokens_routing_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/match_json.rb".freeze]

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, ["> 5.2.0"])
      s.add_runtime_dependency(%q<devise>.freeze, [">= 4.6"])
      s.add_runtime_dependency(%q<rack-oauth2>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.6"])
      s.add_development_dependency(%q<shoulda-matchers>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda-kept-assign-to>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, ["~> 1.7.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, ["> 4.0.0"])
      s.add_dependency(%q<devise>.freeze, [">= 0"])
      s.add_dependency(%q<rack-oauth2>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.14.2"])
      s.add_dependency(%q<shoulda-matchers>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda-kept-assign-to>.freeze, [">= 0"])
      s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.3.0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["> 4.0.0"])
    s.add_dependency(%q<devise>.freeze, [">= 0"])
    s.add_dependency(%q<rack-oauth2>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.14.2"])
    s.add_dependency(%q<shoulda-matchers>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda-kept-assign-to>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.3.0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>.freeze, [">= 0"])
  end
end
