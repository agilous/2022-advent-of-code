# frozen_string_literal: true

require 'debug'

##
# This class implements a solution for the Day Nine problem of the 2022 Advent
# of Code.
class Day09
  attr_accessor :head, :tail, :visits

  def initialize(test: false)
    @test = test
    @knots = 2
    @points = @knots.times.map { { x: 0, y: 0 } }
    @visits = [{ x: 0, y: 0 }]
  end

  def adjacent?(head, tail)
    (same_row?(head, tail) && (head[:y] - tail[:y]).abs < 2) ||
      (same_column?(head, tail) && (head[:x] - tail[:x]).abs < 2) || diagonally_adjacent?(head, tail)
  end

  def close?(head, tail)
    overlapping?(head, tail) || adjacent?(head, tail)
  end

  def diagonally_adjacent?(head, tail)
    return true if !(same_column?(head, tail) || same_row?(head, tail)) &&
                   ((head[:y] - tail[:y]).abs < 2) &&
                   ((head[:x] - tail[:x]).abs < 2)

    false
  end

  def move(point, direction)
    case direction
    when 'D'
      { x: point[:x], y: point[:y] - 1 }
    when 'L'
      { x: point[:x] - 1, y: point[:y] }
    when 'R'
      { x: point[:x] + 1, y: point[:y] }
    when 'U'
      { x: point[:x], y: point[:y] + 1 }
    end
  end

  def move_tail(head, tail, direction)
    return if close?(head, tail)

    same_row?(head, tail) || same_column?(head, tail) ? move(tail, direction) : move_tail_diagonal(head, direction)
  end

  def move_tail_diagonal(head, direction)
    case direction
    when 'D'
      { x: head[:x], y: head[:y] + 1 }
    when 'L'
      { x: head[:x] + 1, y: head[:y] }
    when 'R'
      { x: head[:x] - 1, y: head[:y] }
    when 'U'
      { x: head[:x], y: head[:y] - 1 }
    end
  end

  def overlapping?(head, tail)
    head == tail
  end

  def process_move_at(pointer)
    (@knots - 1).times do
      direction, steps = problem_input[pointer].split
      head = pointer % (@knots - 1)
      tail = head + 1

      puts "Head: #{head}, Tail: #{tail}"

      steps.to_i.times do
        puts "Moving (#{head}, #{tail}) #{direction}"
        # @points[head] = move(@points[head], direction)
        # @points[tail] = move_tail(@points[head], @points[tail], direction)
      end

      # @visits << @points[tail] if pointer % (@knots - 1)
    end
  end

  def same_column?(head, tail)
    head[:y] == tail[:y]
  end

  def same_row?(head, tail)
    head[:x] == tail[:x]
  end

  def solution
    problem_input.length.times { |pointer| process_move_at(pointer) }
    part1 = @visits.uniq.count

    reset_for_part_two
    problem_input.length.times { |pointer| process_move_at(pointer) }
    "Part 1: #{part1}, Part 2: #{@visits.uniq.count}"
  end

  private

  def problem_input
    if @test && @part2
      [
        'R 5',
        'U 8',
        'L 8',
        'D 3',
        'R 17',
        'D 10',
        'L 25',
        'U 20'
      ]
    elsif @test
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

  def reset_for_part_two
    @part2 = true
    @knots = 10
    @points = @knots.times.map { { x: 0, y: 0 } }
    @visits = [{ x: 0, y: 0 }]
  end
end
