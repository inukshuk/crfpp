require 'helper'

module CRFPP
  class TestNative < Test::Unit::TestCase
    def learn
      assert_equal 'learn', Native.learn
    end
    
    def test_version
      assert defined?(Native::VERSION)
    end
    
  end
end