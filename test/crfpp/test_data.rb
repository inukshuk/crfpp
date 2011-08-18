require 'helper'

module CRFPP
  
  class TestData < Test::Unit::TestCase
    
    def test_load_data_from_empty_file
      file = Data.new('template')
      assert Data.new(file.path).to_s.empty?
    ensure
      file.close
      file.unlink
    end

    def test_load_data_from_file
      path = "#{FixturesRoot}/test.data"
      assert_equal 'Rockwell NNP B-NP', Data.new(path)[0].to_s
    end
    
    
  end
  
end
