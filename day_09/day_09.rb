# frozen_string_literal: true

require 'debug'

##
# This class implements a solution for the Day Nine problem of the 2022 Advent
# of Code.
class Day09
  attr_accessor :head, :tail, :visits

  def initialize(test: false)
    @test = test
    @head = { x: 0, y: 0 }
    @tail = { x: 0, y: 0 }
    @visits = [@tail]

    problem_input.each { |move| process_move(move) }
  end

  def adjacent?
    (same_row? && (@head[:y] - @tail[:y]).abs < 2) ||
      (same_column? && (@head[:x] - @tail[:x]).abs < 2) || diagonally_adjacent?
  end

  def diagonally_adjacent?
    return true if !(same_column? || same_row?) &&
                   ((@head[:y] - @tail[:y]).abs < 2) &&
                   ((@head[:x] - @tail[:x]).abs < 2)

    false
  end

  def move(pos, direction)
    case direction
    when 'D'
      { x: pos[:x], y: pos[:y] - 1 }
    when 'L'
      { x: pos[:x] - 1, y: pos[:y] }
    when 'R'
      { x: pos[:x] + 1, y: pos[:y] }
    when 'U'
      { x: pos[:x], y: pos[:y] + 1 }
    end
  end

  def move_tail(direction)
    return if tail_is_close?

    @tail = (same_row? || same_column? ? move(@tail, direction) : move_tail_diagonal(direction))
    @visits << @tail
  end

  def move_tail_diagonal(direction)
    case direction
    when 'D'
      { x: @head[:x], y: @head[:y] + 1 }
    when 'L'
      { x: @head[:x] + 1, y: @head[:y] }
    when 'R'
      { x: @head[:x] - 1, y: @head[:y] }
    when 'U'
      { x: @head[:x], y: @head[:y] - 1 }
    end
  end

  def overlapping?
    @head == @tail
  end

  def process_move(move)
    direction, steps = move.split

    steps.to_i.times { take_step(direction) }
  end

  def same_column?
    @head[:y] == @tail[:y]
  end

  def same_row?
    @head[:x] == @tail[:x]
  end

  def solution
    "Part 1: #{@visits.uniq.count}, Part 2: #{'Bar'}"
  end

  def tail_is_close?
    overlapping? || adjacent?
  end

  def take_step(direction)
    @head = move(@head, direction)
    move_tail(direction)
  end

  private

  def problem_input
    if @test
      [
        'R 4',
        'U 4',
        'L 3',
        'D 1',
        'R 4',
        'D 1',
        'L 5',
        'R 2'
      ]
    else
      input_file = "#{File.expand_path('.', __dir__)}/input.txt"
      File.readlines(input_file, chomp: true)
    end
  end
end
