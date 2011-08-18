module CRFPP
  class Template
    
    extend Forwardable
    
    include Enumerable
    include Filelike
    
    attr_reader :sentences
    
    def_delegators :@sentences, :each, :[]
    
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
          push Feature.parse(line)
        end
      end
      
      self
    end
    
    def clear
      @sentences = [[]]
      self
    end
    
    def to_s
      return '' if empty?
      
      i = -1
      map { |s| s.map { |f| f.respond_to?(:identified?) && !f.identified? ? f.to_s(i += 1) : f }.join("\n") }.zip([]).flatten.join("\n")
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
