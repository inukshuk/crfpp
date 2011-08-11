require 'helper'

module CRFPP
  class TestNative < Test::Unit::TestCase
    def test_hello_world
      assert_equal 'hello world', Native.hello_world
    end
  end
end