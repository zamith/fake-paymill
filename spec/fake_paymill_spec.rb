require 'spec_helper'

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

  context 'VALID_CREDIT_CARDS' do
    it 'includes valid regular credit cards for paymill test mode' do
      valid_credit_cards = %w(
        4111111111111111 5500000000000004
        340000000000009 3530111333300000
        6759000000000000 4973010000000004
        30000000000004 6011111111111117
        6240008631401148
      )
      expect(FakePaymill::VALID_CREDIT_CARDS.sort).to eq valid_credit_cards.sort
    end

    it 'includes valid 3-D Secure credit cards for paymill test mode' do
      valid_credit_cards_3dsecure = %w(
        4012888888881881 5169147129584558
      )
      expect(FakePaymill::VALID_CREDIT_CARDS_3DSECURE.sort).to eq valid_credit_cards_3dsecure.sort
    end
  end

  def write_to_log
    FakePaymill.logger.info("Boom!")
  end
end
