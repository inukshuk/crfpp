require 'helper'

module CRFPP
  class TestNative < Test::Unit::TestCase
    def learn
      assert_equal 'learn', Native.learn
    end
  end
end