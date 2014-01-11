# FakePaymill
[![Build Status](https://travis-ci.org/zamith/fake-paymill.png?branch=master)](https://travis-ci.org/zamith/fake-paymill)

A Paymill fake so that you can avoid hitting Paymill's servers in tests

## Installation

Add this line to your application's Gemfile:

    gem 'fake_paymill', require: false, group: :test

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_paymill

## Usage


Just require the library and you're good to go:

    require 'fake_paymill'

`FakePaymill.clear!` will clear all data, which you almost certainly want to do
before each test.

Full example:

    # spec/spec_helper.rb
    require 'fake_paymill'

    RSpec.configure do |c|
      c.before do
        FakePaymill.clear!
      end
    end

If you're using Cucumber, add this too:

    # features/support/env.rb
    require 'fake_paymill'

    Before do
      FakePaymill.clear!
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

FakePaymill is largely based on thoughtbot's FakeBraintree
