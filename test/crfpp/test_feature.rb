require 'helper'

module CRFPP
  
  class TestFeature < Test::Unit::TestCase
    
    def test_assignment_of_constructor_arguments
      assert_raise(ArgumentError) { Feature.new(1,2,3,4) }
    end
    
    def test_to_s
      assert_equal 'U:%x[0,0]', Feature.new.to_s
      assert_equal 'U:%x[2,3]', Feature.new(Macro.new(2,3)).to_s
      assert_equal 'U01:%x[2,3]', Feature.new(Macro.new(2,3)).to_s(1)
      assert_equal 'U123:%x[2,3]', Feature.new(Macro.new(2,3)).to_s(123)
    end
    
    def test_parse_feature_strings
      assert_equal 'U:%x[42,23]/AB', Feature.parse('U:%x[42,23]/AB').to_s
      assert_equal 'U101:%x[42,23]/AB', Feature.parse('U101:%x[42,23]/AB').to_s
    end
    
    def test_identifier
      assert_equal '01', Feature.new(nil,nil,1).identifier
      assert_equal '02', Feature.new(nil,nil,1).identifier(2)      
      assert_equal '002', Feature.new(nil,nil,1).identifier('002')
    end
    
  end
  
end
