require 'spec_helper'
require 'fake_paymill'

describe FakePaymill do
  it 'creates a log file' do
    expect(File.exist?(FakePaymill.log_file_path)).to be_true
  end

  it 'logs to the correct path' do
    write_to_log
    expect(File.readlines(FakePaymill.log_file_path).last).to include "Boom!"
  end

  context '.log_file_path' do
    it 'is tmp/log' do
      expect(FakePaymill.log_file_path).to eq "tmp/log"
    end
  end

  context '.reset_log!' do
    it 'resets the log file' do
      write_to_log
      FakePaymill.reset_log!
      expect(File.read(FakePaymill.log_file_path)).to eq ''
    end

    it 'is called by clear!' do
      FakePaymill.should_receive(:reset_log!)
      FakePaymill.clear!
    end
  end

  def write_to_log
    FakePaymill.logger.info("Boom!")
  end
end
