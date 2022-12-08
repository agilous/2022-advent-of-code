require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_07'

describe Day07 do
  before do
    @day07 = Day07.new(test: true)
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1: 95437, Part 2: 24933642', @day07.solution)
    end
  end
end
