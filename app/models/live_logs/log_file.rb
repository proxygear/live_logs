module LiveLogs
  #Fake model behaviour
  class LogFile
    def self.all
      file_query = Rails.root, 'log', '*.log'
      Array.new.tap do |res|
        Dir[File.join *file_query].each do |path|
          next if File.directory? path
          res.push new(path)
        end
      end
    end

    def self.find_path file_name
      puts "find_path #{file_name}"
      LogFile.new File.join(Rails.root, 'log', file_name)
    rescue Exception => e
      nil
    end

    attr_reader :name, :path

    def initialize file_path, safe=true
      if safe
        raise "path '#{file_path}' does not exist" unless File.exist? file_path
        raise "given path '#{file_path}' is a folder" if File.directory? file_path
      end
      self.path = file_path
      self.name = file_path.split(File::SEPARATOR).last
    end

    def tail
      LogTail.open self.path
    end

    def to_partial_path
      'log_files/log_file'
    end

    alias :to_param :name

    protected
    attr_writer :name, :path
  end
end