require 'fileutils'
require 'logger'

require "fake_paymill/version"

module FakePaymill
  def self.start!
    reset_log!
    self.logger = Logger.new(log_file_path)
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

  def self.logger
    @logger
  end

  def self.logger=(logger)
    @logger = logger
  end
end

FakePaymill.start!
