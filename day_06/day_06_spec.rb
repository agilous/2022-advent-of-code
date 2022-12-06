require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_06'

describe Day06 do
  before do
    @day06 = Day06.new(test: true)
  end

  describe '#marker' do
    it 'returns the correct marker' do
      assert_equal(7, @day06.marker('mjqjpqmgbljsphdztnvjfqwrcgsmlb'))
      assert_equal(19, @day06.marker('mjqjpqmgbljsphdztnvjfqwrcgsmlb', 14))

      assert_equal(5, @day06.marker('bvwbjplbgvbhsrlpgdmjqwftvncz'))
      assert_equal(23, @day06.marker('bvwbjplbgvbhsrlpgdmjqwftvncz', 14))

      assert_equal(6, @day06.marker('nppdvjthqldpwncqszvftbrmjlhg'))
      assert_equal(23, @day06.marker('nppdvjthqldpwncqszvftbrmjlhg', 14))

      assert_equal(10, @day06.marker('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg'))
      assert_equal(29, @day06.marker('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 14))

      assert_equal(11, @day06.marker('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw'))
      assert_equal(26, @day06.marker('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 14))
    end

    it 'finds a match at the start of a line' do
      assert_equal(5, @day06.marker('abcdexxxxxxxxxxxxxxxxxxxxxxxxxxx', 5))
    end

    it 'finds a match at the end of a line' do
      assert_equal(33, @day06.marker('xxxxxxxxxxxxxxxxxxxxxxxxxxxabcdefg', 7))
    end

    it 'returns nil if no match is found' do
      assert_nil(@day06.marker('xxxxxxxxxxxxxxxxxxxxxxxxxxx'))
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1: 7, Part 2: 19', @day06.solution)
    end
  end
end
