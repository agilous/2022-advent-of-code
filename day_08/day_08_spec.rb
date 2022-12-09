require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_08'

describe Day08 do
  before do
    @day08 = Day08.new(test: true)
  end

  describe '#tree_scenic_score' do
    it 'returns the correct data' do
      assert_equal(1, @day08.scenic_score_top(1, 2))
      assert_equal(1, @day08.scenic_score_left(1, 2))
      assert_equal(2, @day08.scenic_score_right(1, 2))
      assert_equal(2, @day08.scenic_score_bottom(1, 2))
      assert_equal(4, @day08.tree_scenic_score(1, 2))

      assert_equal(2, @day08.scenic_score_top(3, 2))
      assert_equal(2, @day08.scenic_score_left(3, 2))
      assert_equal(2, @day08.scenic_score_right(3, 2))
      assert_equal(1, @day08.scenic_score_bottom(3, 2))
      assert_equal(8, @day08.tree_scenic_score(3, 2))
    end
  end

  describe '#tree_visible?' do
    it 'returns the correct data' do
      assert @day08.visible_from_left?(1, 1)
      assert @day08.visible_from_top?(1, 1)
      refute @day08.visible_from_right?(1, 1)
      refute @day08.visible_from_bottom?(1, 1)
      assert @day08.tree_visible?(1, 1)

      assert @day08.visible_from_right?(1, 2)
      assert @day08.visible_from_top?(1, 2)
      refute @day08.visible_from_left?(1, 2)
      refute @day08.visible_from_bottom?(1, 2)
      assert @day08.tree_visible?(1, 2)

      refute @day08.tree_visible?(1, 3)

      assert @day08.tree_visible?(2, 1)
      assert @day08.visible_from_right?(2, 1)
      refute @day08.visible_from_left?(2, 1)
      refute @day08.visible_from_bottom?(2, 1)
      refute @day08.visible_from_top?(2, 1)

      refute @day08.tree_visible?(2, 2)

      assert @day08.tree_visible?(2, 3)
      assert @day08.visible_from_right?(2, 3)
      refute @day08.visible_from_left?(2, 3)
      refute @day08.visible_from_bottom?(2, 3)
      refute @day08.visible_from_top?(2, 3)

      refute @day08.tree_visible?(3, 1)
      assert @day08.tree_visible?(3, 2)
      refute @day08.tree_visible?(3, 3)
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1: 21, Part 2: 8', @day08.solution)
    end
  end
end
