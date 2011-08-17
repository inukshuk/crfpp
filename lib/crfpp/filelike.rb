module CRFPP
  
  module Filelike
    
    attr_writer :path
    
    def path
      @path ||= Tempfile.new('filelike').path
    end

    def write
      File.open(path, 'w:UTF-8') do |f|
        f.write(to_s)
        f.close
      end
    end
    
    def read
      f = File.open(path, 'r:UTF-8')
      f.read
    ensure
      f.close
    end

  end
  
end
