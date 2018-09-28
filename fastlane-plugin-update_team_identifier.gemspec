# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/update_team_identifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-update_team_identifier'
  spec.version       = Fastlane::UpdateTeamIdentifier::VERSION
  spec.author        = 'Jordan Bondo'
  spec.email         = 'jordan.bondo@gmail.com'

  spec.summary       = 'Updates the Team Identifier for a given target'
  spec.homepage      = "https://github.com/faithfracture/update_team_identifier"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  spec.add_dependency 'xcodeproj', '~> 1.3.3'

  spec.add_development_dependency('pry')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop', '0.49.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('fastlane', '>= 2.105.2')
end
