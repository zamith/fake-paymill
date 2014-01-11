# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_paymill/version'

Gem::Specification.new do |spec|
  spec.name          = "fake_paymill"
  spec.version       = FakePaymill::VERSION
  spec.authors       = ["Zamith"]
  spec.email         = ["zamith.28@gmail.com"]
  spec.description   = %q{A Paymill fake so that you can avoid hitting Paymill's servers in tests}
  spec.summary       = %q{A Paymill fake so that you can avoid hitting Paymill's servers in tests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'capybara'
  spec.add_dependency 'sinatra'
  spec.add_dependency 'thin'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
