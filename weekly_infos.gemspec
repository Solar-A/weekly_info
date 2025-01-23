# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'weekly_infos/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'weekly_infos'
  spec.version     = WeeklyInfos::VERSION
  spec.authors     = ['']
  spec.email       = ['']
  spec.homepage    = 'https://github.com/Solar-A/weekly_infos'
  spec.summary     = ' WeeklyInfos.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 2.5'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'pg'
  spec.add_dependency 'rails', '~> 5.2.3'
end
