require_relative "../lib/new_blog_files"
require 'minitest/autorun'

class NewBlogFilesTest < Minitest::Test
  def setup
    @new_post = NewBlogFiles.new
  end

  def test_it_creates_a_new_md_file
    assert true, @new_post.make_file("~/Desktop", "This is a title")
  end
end
