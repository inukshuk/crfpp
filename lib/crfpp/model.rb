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
    
    def save
      write(@data)
      self
    end
        
  end
end
