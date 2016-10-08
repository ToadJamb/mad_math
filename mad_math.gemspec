# frozen_string_literal: true
Gem::Specification.new do |spec|
  spec.name        = 'mad_math'
  spec.version     = '0.0.0'
  spec.authors     = ['Travis Herrick']
  spec.email       = ['tthetoad@gmail.com']
  spec.summary     = 'Basic statistical functions'
  spec.description = '
    Provides some basic statistical functions for a given data set.
  '.strip
  spec.homepage    = 'http://www.bitbucket.org/ToadJamb/gems_mad_math'
  spec.license     = 'LGPL-3.0'

  spec.files       = Dir['lib/**/*.rb', 'license/*']

  spec.extra_rdoc_files << 'readme.md'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake_tasks'
  spec.add_development_dependency 'gems'
  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'travis-yaml'
  spec.add_development_dependency 'wwtd'
end
