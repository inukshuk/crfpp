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
      save_to(path)
    end
    
    def save_to(file)
      write(file, data? ? data : read)
    end

    def data?
      data && !data.empty?
    end
    
  end
end
