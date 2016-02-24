require "minitest/autorun"
require "../lib/structure"

class StructureTest < Minitest::Test
  def setup
    @structure = Structure.new("Users/JenniferSoden/my_sweet_blog")
  end

  def test_parent_dir_can_be_created
    assert Dir.exists?("/Users/JenniferSoden/my_sweet_blog")
  end

  # def test_raises_argument_error_if_dir_exists
  #   skip
  #   raise ArgumentError, Dir.exists?("/Users/JenniferSoden/my_sweet_blog")
  # end

  # def test_can_build_a_folder_structure
  #   check for existance of
  #     parent_dir/_output
  #
  # end



end
