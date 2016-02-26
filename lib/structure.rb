require 'Date'
class Structure

  def initialize(parent_directory)
    @default_layout = "<!DOCTYPE html>
    <html>
      <head>
        <meta charset='utf-8'>
        <title>Post Title</title>
      </head>
      <body>
        <%= html_content %>
      </body>
    </html>"
    @parent_directory = parent_directory
    make_dir
  end

  def make_dir
    if Dir.exists?(@parent_directory)
      puts "!!!This Directory Already Exists!!!"
      raise ArgumentError
    else
      Dir.mkdir(@parent_directory)
      build_folder_structure
    end
  end

  def build_folder_structure
    date = Date.today.strftime("%Y-%m-%d")
    Dir.mkdir("#{@parent_directory}/_output")
    source_dir = "#{@parent_directory}/source"
    Dir.mkdir("#{source_dir}")
      Dir.mkdir("#{source_dir}/layouts")
        File.write("#{source_dir}/layouts/default.html.erb", @default_layout)
      File.write("#{source_dir}/index.markdown", "# Some Markdown\n\n* a list\n* another item")
      Dir.mkdir("#{source_dir}/css")
        File.write("#{source_dir}/css/main.css", ' ')
      Dir.mkdir("#{source_dir}/pages")
        File.write("#{source_dir}/pages/about.markdown", "# Some Markdown\n\n* a list\n* another item")
      Dir.mkdir("#{source_dir}/posts")
        File.write("#{source_dir}/posts/#{date}-welcome-to-hyde.markdown", "# Some Markdown\n\n* a list\n* another item")
    end
end
