module CRFPP
  
  #
  # A Data object represents test or training data.
  #
  class Data
    
    extend Forwardable
    
    include Enumerable
    include Filelike
    
    attr_reader :tokens

    def_delegators :@tokens, :length, :[], :each
    
    def initialize(path = nil)
      @path = path
      open
    end
    
    def open
      @tokens = read.lines.map { |line| Token.parse(line) }
      @tokens.compact!
      self
    end
    
    def clear
      @tokens = []
      self
    end
   
    def to_s
      @tokens.join("\n")
    end
    
  end
end