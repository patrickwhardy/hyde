require 'kramdown'
require 'Find'
require 'pry'
require 'Date'
require 'erb' #????

#use more readers, less instance variables

class Converter
  attr_reader :html_text
  def initialize(parent_dir)
    @parent_dir = parent_dir
    #binding.pry
    @date = Date.today.strftime("%Y-%m-%d")
    create_output
  end

  def create_output
    build_output_folders
    find_markdown
    copy_css_file
    convert_md
  end
#PASSING IN MACHINE-SPECIFIC PARENT DIR
#NEED TO USE ~/ WITHOUT ERROR!!!
  def find_markdown
    @md_files = Dir.glob("#{@parent_dir}/**/*.markdown")
  end

   def convert_md
     @html_text = @md_files.map do |file|
      Kramdown::Document.new(File.read(file)).to_html
     end
     run_erb(@html_text)
   end

   def run_erb(array)
     output_paths = ["/index.html","/pages/about.html","/posts/#{@date}-welcome-to-hyde.html"]
     erb_template = File.read("#{@parent_dir}/source/layouts/default.html.erb")
     (@html_text.count).times do |i|
       html_content = @html_text[i]
       erb_formatted = ERB.new(erb_template).result(binding)
       File.write("#{@output_dir}#{output_paths[i]}", erb_formatted)
     end
   end

   def build_output_folders
     @output_dir = "#{@parent_dir}/_output"
     Dir.mkdir("#{@output_dir}/css") unless Dir.exists?("#{@output_dir}/css")
     Dir.mkdir("#{@output_dir}/pages") unless Dir.exists?("#{@output_dir}/pages")
     Dir.mkdir("#{@output_dir}/posts") unless Dir.exists?("#{@output_dir}/posts")
   end

   def copy_css_file
     File.write("#{@output_dir}/css/main.css", File.read("#{@parent_dir}/source/css/main.css"))
   end

  #  def write_html_files
  #    File.write("#{@output_dir}/index.html", @html_text[0])
  #    File.write("#{@output_dir}/pages/about.html", @html_text[1])
  #    File.write("#{@output_dir}/posts/#{@date}-welcome-to-hyde.html", @html_text[2])
  #  end

end
