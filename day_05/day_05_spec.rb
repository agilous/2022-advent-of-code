require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_05'

describe Day05 do
  before do
    @day05 = Day05.new
  end

  describe '#build_stacks' do
    stack_lines = [
      '    [D]',
      '[N] [C]',
      '[Z] [M] [P]',
      '1   2   3'
    ]
    stacks = { '1' => %w[Z N], '2' => %w[M C D], '3' => %w[P] }

    it 'correctly builds the stacks from the input' do
      assert_equal(stacks, @day05.build_stacks(stack_lines))
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1 Solution: RTGWZTHLD, Part 2 Solution: STHGRZZFR', @day05.solution)
    end
  end
end
