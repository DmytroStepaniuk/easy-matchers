# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'easy/version'

Gem::Specification.new do |spec|
  spec.name        = 'easy-matchers'
  spec.version     = Easy::Matchers::VERSION
  spec.authors     = ['Igor Zubkov']
  spec.email       = ['igor.zubkov@gmail.com']

  spec.summary     = 'Extra RSpec matchers for Rails'
  spec.description = 'Extra RSpec matches for Rails (ActiveModel::Validators, ActiveModel::Model)'
  spec.homepage    = 'https://github.com/MLSDev/easy-matchers'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency 'rspec', '~> 3.4'
  spec.add_runtime_dependency 'activemodel', '~> 4.2'
end
