require 'helper'

module CRFPP
  class TestTagger < Test::Unit::TestCase
    def test_defined
      assert defined? Tagger
    end
    
    def test_init
      assert Tagger.new
    end
    
  end
end
