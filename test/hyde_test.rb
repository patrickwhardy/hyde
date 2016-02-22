require "minitest/autorun"
require '../bin/hyde'

class HydeTest < Minitest::Test
  def test_args_is_array
    assert_equal ["new", "~/my_sweet_blog"], args
  end
end
