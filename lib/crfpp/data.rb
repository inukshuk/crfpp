module CRFPP
  
  #
  # A Data object represents test or training data.
  #
  class Data
    
    extend Forwardable
    
    include Enumerable
    include Filelike
    
    attr_reader :sentences

    def_delegators :@sentences, :length, :[], :each
    
    def initialize(path = nil)
      @path = path
      open
    end
    
    def open
      clear
      
      read.lines.each do |line|
        line.chomp!
        if line.strip.empty?
          new_sentence 
        else
          push Token.parse(line)
        end
      end
      
      self
    end
    
    def clear
      @sentences = [[]]
      self
    end
    
    def to_s
      empty? ? '' : zip([]).flatten.join("\n")
    end

    def push(feature)
      @sentences.last << feature
      self
    end
    
    alias << push

    def empty?
      [@sentences].flatten(2).compact.empty?
    end
    
    def new_sentence
      @sentences << []
      self
    end
 
  end
end