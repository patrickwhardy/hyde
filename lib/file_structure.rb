require 'Date'
require 'FileUtils'

class Structure
  attr_accessor :parent_dir

  def initialize(parent_dir)
    @parent_dir = parent_dir
    make_dir
  end

  def make_dir
    if Dir.exists?(@parent_dir)
      puts "!!!This Directory Already Exists!!!"
      raise ArgumentError
    else
      # Dir.mkdir(@parent_dir)

      build_folder_structure
    end
  end

  def build_folder_structure
    date = Date.today.strftime("%Y-%m-%d")
    # Dir.mkdir("#{@parent_dir}/_output")
    FileUtils.mkpath "#{@parent_dir}/_output/"
    # source_dir = "#{@parent_dir}/source"
    FileUtils.mkpath "#{@parent_dir}/source"
    # Dir.mkdir("#{source_dir}")
      File.write("source/index.markdown", "# Some Markdown\n\n* a list\n* another item")
    #   Dir.mkdir("#{source_dir}/css")
      FileUtils.mkpath "source/css"
        File.write("source_dir/css/main.css", ' ')
    #   Dir.mkdir("#{source_dir}/pages")
      FileUtils.mkpath "source_dir/pages"
        File.write("source/pages/about.markdown", "# Some Markdown\n\n* a list\n* another item")
    #   Dir.mkdir("#{source_dir}/posts")
      FileUtils.mkpath "source/posts"
        File.write("source/posts/#{date}-welcome-to-hyde.markdown", "# Some Markdown\n\n* a list\n* another item")
    end
end
