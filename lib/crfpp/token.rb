module CRFPP
  class Token
    
    attr_accessor :word, :tags
    
    def self.parse(string)
      tokens = string.split(/\s+/).compact
      tokens.empty? ? nil : new(tokens)
    end
    
    # Creates a new Token instance.
    #
    # call-seq:
    # Token.new(word)
    # Token.new(word, tags)
    # Token.new(word, tag, tag, tag ...)
    #
    def initialize(*arguments)
      @word, *@tags = *arguments.flatten
    end
    
    def answer
      @tags[-1]
    end
    
    def to_s
      [@word.to_s, @tags].flatten.join(' ')
    end
    
  end
end