# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marionette_dust/version'

Gem::Specification.new do |spec|
  spec.name          = "marionette_dust"
  spec.version       = MarionetteDust::VERSION
  spec.authors       = ["RobertoDip"]
  spec.email         = ["dip.jesusr@gmail.com"]
  spec.description   = %q{An easy way to get Marionette.js and Dust.js working together with the asset pipeline}
  spec.summary       = %q{Get up Marionette and Dust in seconds}
  spec.homepage      = "https://github.com/RobertoDip/marionette_dust-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 3.1'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'ejs'

  spec.add_runtime_dependency "execjs", ">= 1.2.9"
  spec.add_runtime_dependency "tilt"
  spec.add_runtime_dependency "sprockets", ">= 2.0.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
