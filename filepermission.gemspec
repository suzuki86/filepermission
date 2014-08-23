# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filepermission/version'

Gem::Specification.new do |spec|
  spec.name          = "filepermission"
  spec.version       = Filepermission::VERSION
  spec.authors       = ["Toshinari Suzuki"]
  spec.email         = ["tsnr0001@gmail.com"]
  spec.summary       = %q{Handle file permission easily.}
  spec.description   = %q{Handle file permission easily.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
