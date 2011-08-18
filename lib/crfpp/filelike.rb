module CRFPP
  
  module Filelike
    
    attr_writer :path
    
    def path
      @path ||= Tempfile.new('filelike').path
    end

    def write(file = path, content = to_s)
      File.open(file, 'w:UTF-8') do |f|
        f.write(content)
        f.close
      end
      self
    end
    
    alias save write
    
    def read
      f = File.open(path, 'r:UTF-8')
      f.read
    ensure
      f.close
    end

  end
  
end
