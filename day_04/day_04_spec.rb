require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_04'

describe Day04 do
  before do
    @day04 = Day04.new
  end

  describe '#fully_contained?' do
    it 'returns true if the first assignment is fully contained in the second' do
      assert @day04.fully_contained?('2-8,3-7')
      assert @day04.fully_contained?('5-5,4-75')
    end

    it 'returns true if the second assignment is fully contained in the first' do
      assert @day04.fully_contained?('6-6,4-6')
    end

    it 'otherwise returns false' do
      refute @day04.fully_contained?('2-4,6-8')
      refute @day04.fully_contained?('2-3,4-5')
      refute @day04.fully_contained?('5-7,7-9')
      refute @day04.fully_contained?('2-6,4-8')
    end
  end

  describe '#overlapping?' do
    it 'returns true if the assignments overlap' do
      assert @day04.overlapping?('5-7,7-9')
      assert @day04.overlapping?('2-8,3-7')
      assert @day04.overlapping?('6-6,4-6')
      assert @day04.overlapping?('2-6,4-8')
    end

    it 'returns false otherwise' do
      refute @day04.overlapping?('2-4,6-8')
      refute @day04.overlapping?('2-3,4-5')
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1 Solution: 582, Part 2 Solution: 893', @day04.solution)
    end
  end
end
