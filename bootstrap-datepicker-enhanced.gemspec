# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap/datepicker/enhanced/version'

Gem::Specification.new do |spec|
  spec.name          = "bootstrap-datepicker-enhanced"
  spec.version       = Bootstrap::Datepicker::Enhanced::VERSION
  spec.authors       = ["Wolfgang Uhl"]
  spec.email         = ["wolfgang.uhl@googlemail.com"]
  spec.description   = %q{Bootstrap Datepicker Enhanced: Write a gem description}
  spec.summary       = %q{Bootstrap Datepicker Enhanced: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "twitter-bootstrap-rails"
  spec.add_dependency "bootstrap-datepicker-rails"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
