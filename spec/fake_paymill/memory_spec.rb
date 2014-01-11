require 'spec_helper'

describe FakePaymill::Memory do
  it 'is called on start' do
    FakePaymill::Memory.should_receive(:new)
    FakePaymill.start!
  end
  it { should have_hash_accessor_for(:clients) }

  context '#clear!' do
    it { should clear_hash_when_cleared(:clients) }
  end
end
