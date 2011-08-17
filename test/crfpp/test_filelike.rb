require 'helper'

module CRFPP
  class TestFilelike < Test::Unit::TestCase
    def setup
      @klass = Class.new
      @klass.instance_eval { include Filelike }      
    end
    
    def subject
      @klass.new
    end
    
    def test_has_a_path_by_default
      assert subject.path
    end
        
  end
end
