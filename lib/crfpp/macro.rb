module CRFPP
  class Macro < Struct.new(:row, :column)

    TEMPLATE = '%%x[%d,%d]'.freeze

    alias col column
    
    def initialize(row = 0, column = 0)
      super
    end
    
    def to_s
      TEMPLATE % values
    end
    
  end
end
