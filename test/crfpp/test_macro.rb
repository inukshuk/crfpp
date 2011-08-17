require 'helper'

module CRFPP
  
  class TestMacro < Test::Unit::TestCase
    
    def test_assignment_of_constructor_arguments
      assert_equal [0, 0], Macro.new.values
      assert_equal [1, 1], Macro.new(1,1).values
      assert_equal [1, 0], Macro.new(1).values
      assert_raise(ArgumentError) { Macro.new(1,2,3) }
    end
    
    def test_to_s
      assert_equal '%x[0,0]', Macro.new.to_s
    end
    
  end
  
end
