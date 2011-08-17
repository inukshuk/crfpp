module CRFPP
  class Template
    
    extend Forwardable
    
    include Filelike
    
    attr_reader :features
    
    def_delegators :@features, :<<, :length
    
    def initialize(path = nil)
      @path = path
      open
    end
    
    def open
      @features = read.lines.map { |line| Feature.parse(line) }      
      self
    end
    
    def clear
      @features = []
    end
    
    def to_s
      i = -1
      features.map { |f| f.is_a?(Feature) ? f.to_s(i += 1) : f.chomp }.join("\n")
    end
    
  end
end
