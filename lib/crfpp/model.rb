module CRFPP
  class Model
    
    include Filelike
    
    def initialize(path = nil)
      @path = path
    end
    
  end
end
