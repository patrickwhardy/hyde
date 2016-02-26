require_relative 'test_helper'
require "minitest/autorun"
require_relative "../lib/structure"

class StructureTest < Minitest::Test
  def setup
    @parent_directory = File.expand_path("~/my_sweet_blog")
    @structure = Structure.new(@parent_directory)
  end

  def teardown
    FileUtils.rm_rf(@parent_directory)
  end

  def test_parent_dir_can_be_created
    assert Dir.exists?(@parent_directory)
  end

  def test_raises_argument_error_if_dir_exists
    assert_raises(ArgumentError) { @structure = Structure.new(@parent_directory) }
  end

  def test_can_build_a_folder_within_the_structure
    assert Dir.exists?("#{@parent_directory}/source/layouts")
    assert Dir.exists?("#{@parent_directory}/source/css")
    assert Dir.exists?("#{@parent_directory}/source/posts")
  end

  def test_can_create_files_within_the_structure
    assert File.exists?("#{@parent_directory}/source/layouts/default.html.erb")
    assert File.exists?("#{@parent_directory}/source/pages/about.markdown")
  end

end
