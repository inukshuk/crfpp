require 'helper'

module CRFPP
  class TestUtilities < Test::Unit::TestCase
    
    def test_create_a_new_model_file_through_training
      model = CRFPP.learn("#{FixturesRoot}/template", "#{FixturesRoot}/train.data")
      assert !model.open.data.empty?
    end
        
  end
end