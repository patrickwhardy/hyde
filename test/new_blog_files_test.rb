require_relative "../lib/new_blog_files"
require 'minitest/autorun'

class NewBlogFilesTest < Minitest::Test
  def setup
    @new_post = NewBlogFiles.new("/Users/JenniferSoden/", "this_is_a_title")
    @new_post.make_file
  end

#change message tests to accept an array, and then join to make a string.

  def test_class_accepts_a_path

    assert_equal "/Users/JenniferSoden/", @new_post.path
  end

  def test_class_accepts_a_string_path
    assert String, @new_post.path
  end

  def test_class_accepts_a_post_title
    assert_equal "this_is_a_title", @new_post.post_title
  end

  def test_class_accepts_a_string_post_title
    assert String, @post_title
  end

  def test_class_has_a_default_message
    assert_equal "Your content here", @new_post.message
  end

  def test_class_can_accept_a_message
    new_post = NewBlogFiles.new("/Users/JenniferSoden/", "this_is_a_title", "MESSAGE!")
    new_post.make_file
    assert_equal "MESSAGE!", new_post.message
  end

  def test_make_file_creates_a_new_markdown_file
    File.delete("/Users/JenniferSoden/this_is_a_title.markdown")
    refute File.exist?(@new_post.post_title)
    @new_post.make_file
    assert true, File.exist?(@new_post.post_title)
  end
end
