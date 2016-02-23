require 'Date'

class Structure
  def initialize(parent_dir)
    @parent_dir = parent_dir
  end

  def make_dir
    if Dir.exists?(@parent_dir)
      puts "!!!This Directory Already Exists!!!"
      raise ArgumentError
    else
      Dir.mkdir(@parent_dir)
    end
  end

  def build_folder_structure
    date = Date.today.strftime("%Y-%m-%d")
    Dir.mkdir("#{@parent_dir}/_output")
    source_dir = "#{@parent_dir}/source"
    Dir.mkdir("#{source_dir}")
      File.write("#{source_dir}/index.markdown", ' ')
      Dir.mkdir("#{source_dir}/css")
        File.write("#{source_dir}/css/main.css", ' ')
      Dir.mkdir("#{source_dir}/pages")
        File.write("#{source_dir}/pages/about.markdown", ' ')
      Dir.mkdir("#{source_dir}/posts")
        File.write("#{source_dir}/posts/#{date}-welcome-to-hyde.markdown", ' ')
    end
end
