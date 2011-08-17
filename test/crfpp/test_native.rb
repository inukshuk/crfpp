require 'helper'

module CRFPP
  class TestNative < Test::Unit::TestCase
    
    def test_create_a_new_model_file_through_training
      model = Tempfile.new('model')
      assert Native.learn("#{FixturesRoot}/template #{FixturesRoot}/train.data #{model.path}"), 'Native.learn returned with error exit status'
      assert model.length > 0, 'nothing was written to model file'
    ensure
      model.close
      model.unlink
    end
    
    def test_version
      assert defined?(Native::VERSION)
    end
    
  end
end