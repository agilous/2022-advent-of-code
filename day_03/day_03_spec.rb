require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_03'

describe Day03 do
  before do
    @day03 = Day03.new
  end

  describe '#intersection' do
    it 'returns the only character duplicated in both halves of a string' do
      line = 'vJrwpWtwJgWrhcsFMMfFFhFp'
      assert_equal('p', @day03.intersection(line))
    end
  end

  describe '#priority' do
    it 'returns the correct priority for the given lines' do
      lines1 = [
        'vJrwpWtwJgWrhcsFMMfFFhFp',
        'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
        'PmmdzqPrVvPwwTWBwg'
      ]
      lines2 = [
        'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
        'ttgJtRGJQctTZtZT',
        'CrZsJsPPZsGzwwsLwLmpwMDw'
      ]

      assert_equal(18, @day03.priority(lines1))
      assert_equal(52, @day03.priority(lines2))
    end
  end

  describe '#score' do
    it 'returns the correct score for a given character' do
      assert_equal(16, @day03.score('p'))
      assert_equal(38, @day03.score('L'))
      assert_equal(42, @day03.score('P'))
      assert_equal(22, @day03.score('v'))
      assert_equal(20, @day03.score('t'))
      assert_equal(19, @day03.score('s'))
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1 Priority Sum: 8252, Part 2 Sum: 2828', @day03.solution)
    end
  end
end
