require 'minitest/autorun'
require 'minitest/spec'
require_relative 'day_09'

describe Day09 do
  before do
    @day09 = Day09.new(test: true)
  end

  describe '#adjacent?' do
    # For ease of logic, up, down, left & right are assigned like graph
    # coordinates with { x: 0, y: 0 } being the origin.
    describe 'when head is one above tail' do
      it 'returns true' do
        head = { x: 0, y: 1 }
        tail = { x: 0, y: 0 }

        assert @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is two (or more) above tail' do
      it 'returns false' do
        head = { x: 0, y: 2 }
        tail = { x: 0, y: 0 }

        refute @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is one below tail' do
      it 'returns true' do
        head = { x: 0, y: 0 }
        tail = { x: 1, y: 0 }

          assert @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is two (or more) below tail' do
      it 'returns false' do
        head = { x: 0, y: 0 }
        tail = { x: 2, y: 0 }

        refute @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is one left of tail' do
      it 'returns true' do
        head = { x: -1, y: 0 }
        tail = { x: 0, y: 0 }

        assert @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is two (or more) left of tail' do
      it 'returns false' do
        head = { x: -2, y: 0 }
        tail = { x: 0, y: 0 }

        refute @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is one right of tail' do
      it 'returns true' do
        head = { x: 1, y: 0 }
        tail = { x: 0, y: 0 }

        assert @day09.adjacent?(head, tail)
      end
    end

    describe 'when head is two (or more) right of tail' do
      it 'returns false' do
        head = { x: 2, y: 0 }
        tail = { x: 0, y: 0 }

        refute @day09.adjacent?(head, tail)
      end
    end
  end

  describe '#diagonally_adjacent?' do
    # For ease of logic, up, down, left & right are assigned like graph
    # coordinates with { x: 0, y: 0 } being the origin.
    describe 'when head is one above and left of tail' do
      it 'returns true' do
        head = { x: -1, y: 1 }
        tail = { x: 0, y: 0 }

        assert @day09.diagonally_adjacent?(head, tail)
      end
    end

    describe 'when head is one above and right of tail' do
      it 'returns true' do
        head = { x: 1, y: 1 }
        tail = { x: 0, y: 0 }

        assert @day09.diagonally_adjacent?(head, tail)
      end
    end

    describe 'when head is one below and left of tail' do
      it 'returns true' do
        head = { x: -1, y: -1 }
        tail = { x: 0, y: 0 }

        assert @day09.diagonally_adjacent?(head, tail)
      end
    end

    describe 'when head is one below and right of tail' do
      it 'returns true' do
        head = { x: 1, y: -1 }
        tail = { x: 0, y: 0 }

        assert @day09.diagonally_adjacent?(head, tail)
      end
    end

    describe 'otherwise' do
      it 'returns false' do
        head = { x: 1, y: -2 }
        tail = { x: 0, y: 0 }
        refute @day09.diagonally_adjacent?(head, tail)

        head = { x: 1, y: -2 }
        tail = { x: 0, y: 0 }
        refute @day09.diagonally_adjacent?(head, tail)

        head = { x: 1, y: -2 }
        tail = { x: 0, y: 0 }
        refute @day09.diagonally_adjacent?(head, tail)

        head = { x: 1, y: -2 }
        tail = { x: 0, y: 0 }
        refute @day09.diagonally_adjacent?(head, tail)
      end
    end
  end

  describe '#solution' do
    it 'returns the correct results' do
      assert_equal('Part 1: 13, Part 2: 36', @day09.solution)
    end
  end
end
