# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake/paymill/version'

Gem::Specification.new do |spec|
  spec.name          = "fake-paymill"
  spec.version       = Fake::Paymill::VERSION
  spec.authors       = ["Zamith"]
  spec.email         = ["luis@zamith.pt"]
  spec.description   = %q{A Paymill fake so that you can avoid hitting Paymill's servers in tests}
  spec.summary       = %q{A Paymill fake so that you can avoid hitting Paymill's servers in tests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
