require "minitest/autorun"
require '../lib/structure'

class StructureTest < Minitest::Test
  def setup
    structure = Structure.new("~/my_sweet_blog")
  end

  def test_source_dir_created
    Dir.exist?("~/my_sweet_blog/source")
  end

end
