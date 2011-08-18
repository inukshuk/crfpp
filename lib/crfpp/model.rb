module CRFPP
  class Model
    
    include Filelike
    
    attr_reader :data
    
    def initialize(path = nil)
      @data, @path = '', path
    end
    
    def open
      @data = read
      self
    end
    
    alias to_s data
    
    def inspect
      "<Model #{path}>"
    end
    
    def save_to(filename)
      @path = filename
      save
    end
        
  end
end
