require 'Date'
require "minitest/autorun"
require 'minitest/pride'
require_relative '../lib/converter'

class ConverterTest < Minitest::Test
  def setup
    @parent_directory = "/Users/patrickwhardy/my_sweet_blog"
    @converter = Converter.new(@parent_directory)
    @date = Date.today.strftime("%Y-%m-%d")
  end

  def test_find_markdown_returns_markdown_files
    assert_equal [ "#{@parent_directory}/source/index.markdown", "#{@parent_directory}/source/pages/about.markdown", "#{@parent_directory}/source/posts/#{@date}-welcome-to-hyde.markdown"], @converter.find_markdown
  end
#this needs the following to be in all .md files
# "# Some Markdown\n\n* a list\n* another item"
  def test_convert_md_intakes_markdown_and_outputs_html
    @converter.find_markdown
    @converter.convert_md
    assert_equal ["<p>”# Some Markdown\\n\\n* a list\\n* another item”</p>\n",
 "<p>”# Some Markdown\\n\\n* a list\\n* another item”</p>\n",
 "<p>”# Some Markdown\\n\\n* a list\\n* another item”</p>\n"], @converter.html_text
  end

  def test_build_output_folders_makes_dirs_and_css
    @converter.build_output_folders
    Dir.exists?("~/my_sweet_blog/_output/css")
    Dir.exists?("~/my_sweet_blog/_output/pages")
    Dir.exists?("~/my_sweet_blog/_output/posts")
    File.exists?("~/my_sweet_blog/_output/css/main.css")
  end

  def test_write_html_files_copies_directories_in_output
    @converter.create_output
    File.exists?("~/my_sweet_blog/_output/index.html")
    File.exists?("~/my_sweet_blog/_output/pages/about.html")
    File.exists?("~/my_sweet_blog/_output/posts/#{date}-welcome-to-hyde.html")
  end
  #Errno::EEXIST: File exists @ dir_s_mkdir - /Users/patrickwhardy/my_sweet_blog/_output/css
end
