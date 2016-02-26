require_relative 'test_helper'
require "minitest/autorun"
require "../lib/structure"

class StructureTest < Minitest::Test
  def setup
    @parent_directory = File.expand_path("~/my_sweet_blog")
    @structure = Structure.new(@parent_directory)
  end

  def test_parent_dir_can_be_created
    assert Dir.exists?(@parent_directory)
  end

  # def test_raises_argument_error_if_dir_exists
  #   @structure = Structure.new(@parent_directory)
  #   raise ArgumentError, Dir.exists?(@parent_directory)
  # end

  # def test_can_build_a_folder_structure
  #   check for existance of
  #     parent_dir/_output
  #
  # end

  #def test_can_create_base_files
    #check exsistance of date-welcometomarkdown

  def teardown
    FileUtils.rm_rf(@parent_directory)
  end

end
