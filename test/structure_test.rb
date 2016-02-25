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
    # assert, Dir.exists?(@home)
  #   delete("#{@parent_dir}")
  end

  # def test_raises_argument_error_if_dir_exists
  #   raise ArgumentError, Dir.exists?("/Users/JenniferSoden/my_sweet_blog")
  # end

  # def test_can_build_a_folder_structure
  #   check for existance of
  #     parent_dir/_output
  #
  # end

  def teardown
    FileUtils.rm_rf(@parent_directory)
  end

end
