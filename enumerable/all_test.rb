require 'minitest/autorun'
require_relative 'all'

class AllTest < MiniTest::Test
  # all? -> bool
  def test_all
    assert_equal true, [true, true].all?
    assert_equal false, [true, false].all?
  end

  # all? {|item| ... } -> bool
  def test_block_given
    assert_equal true, [5, 6, 7].all?(&:positive?)
    assert_equal false, [5, -1, 7].all?(&:positive?)
    assert_equal true, [].all?(&:positive?)
  end

  # all?(pattern) -> bool
  def test_pattern
    assert_equal false, %w[ant bear cat].all?(/t/)
    assert_equal true, %w[peach bear eat].all?(/ea/)
    assert_equal true, [1, 50, 99].any?(Integer)
  end
end
