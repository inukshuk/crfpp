require 'helper'

module CRFPP
  class TestNative < Test::Unit::TestCase
    
    FIXTURES_ROOT = File.expand_path('../../fixtures', __FILE__)
    
    def test_create_a_new_model_file_through_training
      model = Tempfile.new('model')
      assert Native.learn("#{FIXTURES_ROOT}/template #{FIXTURES_ROOT}/train.data #{model.path}")
      assert model.length > 0
    ensure
      model.close
      model.unlink
    end
    
    def test_version
      assert defined?(Native::VERSION)
    end
    
  end
end