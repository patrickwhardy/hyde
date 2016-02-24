require 'Date'
require "minitest/autorun"
require 'minitest/pride'
require_relative '../lib/converter'

class ConverterTest < Minitest::Test
  def setup
    @converter = Converter.new("/Users/patrickwhardy/my_sweet_blog")
  end

  def test_find_markdown_returns_markdown_files
    date = Date.today.strftime("%Y-%m-%d")
    assert_equal ["about.markdown", "index.markdown", "#{date}-welcome-to-hyde.markdown"], @converter.find_markdown
  end

  def test_convert_intakes_markdown_and_outputs_html

  end

  def test_METHOD_copies_non_markdown_files_into_output

  end

  def test_METHOD_copies_directories_in_output

  end
end
