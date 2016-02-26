require_relative 'test_helper'
require 'Date'
require "minitest/autorun"
require 'minitest/pride'
require_relative "../lib/structure"
require_relative '../lib/converter'

class ConverterTest < Minitest::Test
  def setup
    Structure.new(@parent_directory)
    @parent_directory = File.expand_path("~/my_sweet_blog")
    @converter = Converter.new(@parent_directory)
  end

  def teardown
   FileUtils.rm_rf(@parent_directory)
  end

  def test_find_markdown_returns_markdown_files
    skip
    assert_equal [ "#{@parent_directory}/source/index.markdown",
       "#{@parent_directory}/source/pages/about.markdown",
        "#{@parent_directory}/source/posts/#{@date}-welcome-to-hyde.markdown"], @converter.md_files
  end
#this needs the following to be in all .md files
# "# Some Markdown\n\n* a list\n* another item"
  def test_convert_md_intakes_markdown_and_outputs_html
    skip
    assert_equal "<h1 id=\"some-markdown\">Some Markdown</h1>
<ul>
  <li>a list</li>
  <li>another item</li>
</ul>", @converter.html_text[0]
  end

  def test_build_output_folders_makes_dirs_and_css
    skip
    assert Dir.exists?("~/my_sweet_blog/_output/css")
    assert Dir.exists?("~/my_sweet_blog/_output/pages")
    assert Dir.exists?("~/my_sweet_blog/_output/posts")
    assert File.exists?("~/my_sweet_blog/_output/css/main.css")
  end

  def test_write_html_files_copies_directories_in_output
    skip
    assert File.exists?("#{@parent_directory}/_output/index.html")
    assert File.exists?("#{@parent_directory}/_output/pages/about.html")
    assert File.exists?("#{@parent_directory}/_output/posts/#{date}-welcome-to-hyde.html")
  end

end
