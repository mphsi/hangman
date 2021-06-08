# frozen_string_literal: true

require_relative 'lib/rangman/version'

Gem::Specification.new do |spec|
  spec.name          = 'rangman'
  spec.version       = Rangman::VERSION
  spec.authors       = ['Paul Hernández']
  spec.email         = ['mpaul.hernandez@gmail.com']

  spec.summary       = 'The Hangman game made with Ruby.'
  spec.homepage      = 'https://github.com/mphsi/rangman'
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*']

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.add_development_dependency 'rspec', '~> 3.1.0'
end
