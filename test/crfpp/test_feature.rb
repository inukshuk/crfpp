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
    end
    
    
  end
  
end
