require 'kramdown'
require 'Find'
require 'pry'
require 'Date'
require 'erb'

class Converter
  attr_reader :html_text, :date, :md_files, :date

  def initialize(parent_directory)
    # break out parent dir to attr reader
    @parent_directory = parent_directory
    @output_dir = "#{@parent_directory}/_output"
    @date = Date.today.strftime("%Y-%m-%d")

    create_output
  end

  def create_output
    build_output_folders
    find_markdown
    copy_css_file
    convert_md
  end

  def find_markdown
    Dir.glob("#{@parent_directory}/**/*.markdown")
  end

   def convert_md
     html_text = find_markdown.map do |file|
      Kramdown::Document.new(File.read(file)).to_html
     end
     run_erb(html_text)
   end

  def make_output_paths
    find_markdown.map do |file|
       words = file.split("/")
       words[4] = "_output"
       words.join("/")
     end
   end

   def run_erb(html_text)
     erb_template = File.read("#{@parent_directory}/source/layouts/default.html.erb")
     (html_text.count).times do |i|
       html_content = html_text[i]
       erb_formatted = ERB.new(erb_template).result(binding)
       File.write(make_output_paths[i], erb_formatted)
     end
   end

   def convert_posts(file)
     erb_template = File.read("#{@parent_directory}/source/layouts/default.html.erb")
     html_content = Kramdown::Document.new(File.read(file)).to_html
     erb_formatted = ERB.new(erb_template).result(binding)
     File.write("#{@output_dir}", erb_formatted)
   end

   def build_output_folders
     # iterate over the paths and do the checks

     Dir.mkdir("#{@output_dir}/css") unless Dir.exists?("#{@output_dir}/css")
     Dir.mkdir("#{@output_dir}/pages") unless Dir.exists?("#{@output_dir}/pages")
     Dir.mkdir("#{@output_dir}/posts") unless Dir.exists?("#{@output_dir}/posts")
   end

   def copy_css_file
     File.write("#{@output_dir}/css/main.css", File.read("#{@parent_directory}/source/css/main.css"))
   end
   
  #  inputs = { type: 'path' }
  #  inputs[:css]

end
