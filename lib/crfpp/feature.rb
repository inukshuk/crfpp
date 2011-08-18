module CRFPP
  
  class Feature < Struct.new(:content, :type, :id)
    
    class << self
      def parse(string)
        if string =~ /^([UB])(\d*):(.+)\s*$/
          Feature.new($3, $1.to_sym, $2)
        else
          string
        end
      end
    end
    
    def initialize(content = Macro.new, type = :U, id = nil)
      super
    end
    
    def identifier(base = id)
      base.is_a?(Numeric) ? ('%02d' % base) : base
    end
    
    def to_s(number = id)
      [type.to_s.upcase, identifier(number), ':', content].compact.join
    end
    
    def identified?
      !id.nil?
    end
    
  end
  
end
