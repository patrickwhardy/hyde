require_relative 'test_helper'
require 'Date'
require "minitest/autorun"
require 'minitest/pride'
require_relative "../lib/structure"
require_relative '../lib/converter'

class ConverterTest < Minitest::Test
  def setup
    @parent_directory = File.expand_path("~/my_sweet_blog")
    Structure.new(@parent_directory)
    @converter = Converter.new(@parent_directory)
  end

  def teardown
   FileUtils.rm_rf(@parent_directory)
  end

  def test_find_markdown_returns_markdown_files
    assert_equal ["#{@parent_directory}/source/index.markdown",
       "#{@parent_directory}/source/pages/about.markdown",
        "#{@parent_directory}/source/posts/#{@converter.date}-welcome-to-hyde.markdown"], @converter.md_files
  end

  def test_convert_md_intakes_markdown_and_outputs_html
#when you make a markdown, it takes markdown from source and
#makes an html file in output
  end

  def test_build_output_folders_makes_dirs_and_css
    assert Dir.exists?("#{@parent_directory}/_output/css")
    assert Dir.exists?("#{@parent_directory}/_output/pages")
    assert Dir.exists?("#{@parent_directory}/_output/posts")
    assert File.exists?("#{@parent_directory}/_output/css/main.css")
  end

  def test_write_html_files_copies_directories_in_output
    assert File.exists?("#{@parent_directory}/_output/index.html")
    assert File.exists?("#{@parent_directory}/_output/pages/about.html")
    assert File.exists?("#{@parent_directory}/_output/posts/#{@converter.date}-welcome-to-hyde.html")
  end

end
