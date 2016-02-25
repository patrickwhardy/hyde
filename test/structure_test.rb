require "minitest/autorun"
require "../lib/file_structure"

class StructureTest < Minitest::Test
  # def setup
  #   @structure = Structure.new("Users/JenniferSoden/my_sweet_blog")
  # end

  #look at minitest docs to find if I can programatically run autorun
  #set dir, run autorun, delete dirs

  # OR

  #manually run every test method

  # def teardown
  #   @structure
  # end
  #
  def test_parent_dir_can_be_created
    assert, Dir.exists?(@home)
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


end
