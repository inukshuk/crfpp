module CRFPP

  class Error < StandardError
    
    attr_accessor :original
    
    def initialize(message = nil, original = $!)
      super(message)
      @original = original
    end
    
  end
  
  class NativeError < Error; end
  
end
