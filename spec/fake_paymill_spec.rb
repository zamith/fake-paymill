require 'spec_helper'
require 'fake_paymill'

describe FakePaymill do
  context '.log_file_path' do
    it 'is tmp/log' do
      expect(FakePaymill.log_file_path).to eq "tmp/log"
    end
  end
end
