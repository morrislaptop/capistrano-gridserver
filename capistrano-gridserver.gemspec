# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-gridserver'
  spec.version       = '0.0.2'
  spec.authors       = ['Craig Morris']
  spec.email         = ['craig.michael.morris@gmail.com']
  spec.description   = %q{Fixes issues related to using Capistrano with MediaTemple's grid server}
  spec.summary       = %q{Fixes issues related to using Capistrano with MediaTemple's grid server by creating relative symlinks for current and your linked_dirs}
  spec.homepage      = 'https://github.com/morrislaptop/capistrano-gridserver'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
