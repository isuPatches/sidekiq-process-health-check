# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/process_health/check/version'

Gem::Specification.new do |spec|
  spec.name          = 'sidekiq-process-health-check'
  spec.version       = Sidekiq::ProcessHealth::Check::VERSION
  spec.authors       = ['isuPatches']
  spec.email         = ['isuPatches@yahoo.com']

  spec.summary       = 'A gem that when configured and used properly will provide a page displaying if the sidekiq processes are within expected operating parameters'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/isuPatches/sidekiq-process-health-check'
  spec.license       = 'MIT'

  spec.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  spec.add_dependency 'rails', '>= 5'
  spec.add_dependency 'responders', '~> 2.0'
  spec.add_dependency 'sidekiq', '~> 5'

  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'capybara-webkit'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'launchy'
  spec.add_development_dependency 'listen'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'sidekiq', '~> 5'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
