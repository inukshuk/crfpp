require 'helper'

module CRFPP
  class TestTagger < Test::Unit::TestCase
    def test_defined
      assert defined?(Tagger)
    end
    
    def test_initialize
      assert_raise(ArgumentError) do
        Tagger.new
      end
    end
        
  end
end
