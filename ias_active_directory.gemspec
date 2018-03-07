# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ias_active_directory/version'

Gem::Specification.new do |spec|
  spec.name          = 'ias_active_directory'
  spec.version       = IasActiveDirectory::VERSION
  spec.authors       = ['Mark Holmberg']
  spec.email         = ['mark.holmberg@icentris.com']

  spec.summary       = 'iCentris AD integration'
  spec.description   = 'Integrates with Active Directory.'
  spec.homepage      = 'http://icentris.com'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ''
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'net-ldap', '~> 0.16.0'
  spec.add_dependency 'bindata', '~> 2'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'yard', '~> 0.9.9'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.15', '>= 1.15.1'
  spec.add_development_dependency 'pry', '~> 0.11'
end
