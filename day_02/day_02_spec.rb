require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_02'

describe Day02 do
  before do
    @day02 = Day02.new
  end

  describe '#needed_score' do
    it 'returns zero (0) when a loss is specified' do
      assert_equal(0, @day02.needed_score('A X'))
      assert_equal(0, @day02.needed_score('B X'))
      assert_equal(0, @day02.needed_score('C X'))
    end

    it 'returns three (3) when a draw is specified' do
      assert_equal(3, @day02.needed_score('A Y'))
      assert_equal(3, @day02.needed_score('B Y'))
      assert_equal(3, @day02.needed_score('C Y'))
    end

    it 'returns six (6) when a win is specified' do
      assert_equal(6, @day02.needed_score('A Z'))
      assert_equal(6, @day02.needed_score('B Z'))
      assert_equal(6, @day02.needed_score('C Z'))
    end
  end

  describe '#played_score' do
    # Rock played, need a loss, rock beats scissors, scissors = 3
    it 'handles rock played needing a loss' do
      line = 'A X'
      assert_equal(3, @day02.played_score(line))
    end

    # Rock played, need a draw, rock draws rock, rock = 1
    it 'handle rock played needing a draw' do
      line = 'A Y'
      assert_equal(1, @day02.played_score(line))
    end

    # Rock played, need a win, rock losses to paper, paper = 2
    it 'hanldes rock played needing a win' do
      line = 'A Z'
      assert_equal(2, @day02.played_score(line))
    end

    # Paper played, need a loss, paper beats rock, rock = 1
    it 'handles paper played needing a loss' do
      line = 'B X'
      assert_equal(1, @day02.played_score(line))
    end

    # Paper played, need a draw, paper draws paper, paper = 2
    it 'handles paper played needing a draw' do
      line = 'B Y'
      assert_equal(2, @day02.played_score(line))
    end

    # Paper played, need a win, paper losses to scissors, scissors = 3
    it 'handles paper played needing a win' do
      line = 'B Z'
      assert_equal(3, @day02.played_score(line))
    end

    # Scissors played, need a loss, scissors beats paper, paper = 2
    it 'handles scissors played needing a loss' do
      line = 'C X'
      assert_equal(2, @day02.played_score(line))
    end

    # Scissors played, need a draw, scissors draws scissors, scissors = 3
    it 'handles scissors played needing a draw' do
      line = 'C Y'
      assert_equal(3, @day02.played_score(line))
    end

    # Scissors played, need a win, scissors losses to rock, rock = 1
    it 'handles scissors played needing a win' do
      line = 'C Z'
      assert_equal(1, @day02.played_score(line))
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1 Score: 10994, Part 2 Score: 12526', @day02.solution)
    end
  end
end
