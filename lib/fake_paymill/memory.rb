module FakePaymill
  class Memory
    attr_accessor :clients

    def initialize
      clear!
    end

    def clear!
      @clients = {}
    end
  end
end
