require 'fileutils'
module JThumbnail
  class Storage

    class << self
      private
      def path(t_id)
        key  = "#{(1..(12 - t_id.to_s.size)).collect{|i| '0'}*''}#{t_id}"
        dir  = "/#{key[9..11]}/#{key[6..8]}/#{key[3..5]}/#{key[0..2]}"
        file =  key[0..2]
        return [dir,file]
      end
    end

    def self.add(thumbnail_id,data)
      begin

        t_dir, t_file  = path(thumbnail_id)
        st_dir         = File.join(STORAGE_CONFIG['path'],t_dir)

        FileUtils.mkdir_p(st_dir)
        File.open("#{st_dir}/#{t_file}",'w'){|f| f.write data}

        return File.join(t_dir,t_file)
      rescue
        return nil
      end
    end

    def self.delete(thumbnail_id)
      begin
        t_dir, t_file  = path(thumbnail_id)
        st_path         = File.join(STORAGE_CONFIG['path'],t_dir,t_file)
        FileUtils.rm_rf(st_path)

        return File.join(t_dir,t_file)

      rescue
        return nil
      end
    end

  end
end
