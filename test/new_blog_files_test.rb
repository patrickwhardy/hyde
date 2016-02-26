require_relative 'test_helper'
require_relative "../lib/new_blog_files"
require_relative "../lib/structure"
require 'minitest/autorun'

class NewBlogFilesTest < Minitest::Test
  def setup
    @parent_directory = File.expand_path("~/my_sweet_blog")
    Structure.new(@parent_directory)
    @new_post = NewBlogFiles.new(@parent_directory, "this_is_a_title")
    @new_post.make_file
  end

  def teardown
    FileUtils.rm_rf(@parent_directory)
  end

  def test_class_accepts_a_path
    assert_equal @parent_directory, @new_post.parent_directory
  end

  def test_class_accepts_a_string_path
    assert String, @new_post.parent_directory
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
    new_post = NewBlogFiles.new(@parent_directory, "this_is_a_title", "MESSAGE!")
    new_post.make_file
    assert_equal "MESSAGE!", new_post.message
  end

  def test_make_file_creates_a_new_markdown_file
    FileUtils.rm_rf("#{@parent_directory}/this_is_a_titlemarkdown")
    refute File.exist?(@new_post.post_title)
    @new_post.make_file
    assert true, File.exist?(@new_post.post_title)
  end
end
