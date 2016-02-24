require 'kramdown'
require 'Find'

class Converter
  def initialize(parent_dir)
    @parent_dir = parent_dir
  end

  def find_markdown
    Dir.glob("#{@parent_dir}/**/*.markdown")
    #Dir.foreach(@parent_dir)

    # * == anyfile/dir name
  #   md_file_paths = []
  #   Find.find(@parent_dir) do |path|
  #     md_file_paths << path if path =~ /.*\.md$/
  #   end
  #   md_file_paths
   end
end
