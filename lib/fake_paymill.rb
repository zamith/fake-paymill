require 'fileutils'
require 'logger'
require 'paymill'

require 'fake_paymill/memory'

require 'fake_paymill/valid_credit_cards'
require 'fake_paymill/server'
require 'fake_paymill/helpers'
require 'fake_paymill/sinatra_app'
require 'fake_paymill/version'

module FakePaymill
  def self.start!
    reset_log!
    self.logger = Logger.new(log_file_path)
    self.memory = Memory.new
    boot_server
    set_configuration
  end

  def self.clear!
    reset_log!
  end

  def self.log_file_path
    'tmp/log'
  end

  def self.reset_log!
    FileUtils.mkdir_p(File.dirname(log_file_path))
    File.new(log_file_path, 'w').close
  end

  def self.boot_server
    Server.new.boot
  end

  def self.set_configuration
    Paymill.api_base = '0.0.0.0'
    Paymill.api_port = ENV['GATEWAY_PORT']
    Paymill.development = true
  end

  def self.logger
    @logger
  end

  def self.logger=(logger)
    @logger = logger
  end

  def self.memory
    @memory
  end

  def self.memory=(memory)
    @memory = memory
  end
end

FakePaymill.start!
