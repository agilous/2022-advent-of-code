# frozen_string_literal: true

require 'debug'

class Day04
  def initialize
    @part1_solution = 0
    @part2_solution = 0
  end

  def fully_contained?(line)
    bounds = line.split(',').map { |a| a.split('-') }

    first_contains_second?(bounds) || second_contains_first?(bounds)
  end

  def overlapping?(line)
    bounds = line.split(',').map { |a| a.split('-') }

    bounds[0][0].to_i.between?(bounds[1][0].to_i, bounds[1][1].to_i) ||
      bounds[0][1].to_i.between?(bounds[1][0].to_i, bounds[1][1].to_i) ||
      bounds[1][0].to_i.between?(bounds[0][0].to_i, bounds[0][1].to_i) ||
      bounds[1][1].to_i.between?(bounds[0][0].to_i, bounds[0][1].to_i)
  end

  def solution
    File.readlines('./day_04/input.txt', chomp: true).each do |line|
      @part1_solution += 1 if fully_contained?(line)
      @part2_solution += 1 if overlapping?(line)
    end

    "Part 1 Solution: #{@part1_solution}, Part 2 Solution: #{@part2_solution}"
  end

  private

  def first_contains_second?(bounds)
    (bounds[0][0].to_i <= bounds[1][0].to_i) && (bounds[1][1].to_i <= bounds[0][1].to_i)
  end

  def second_contains_first?(bounds)
    (bounds[1][0].to_i <= bounds[0][0].to_i) && (bounds[0][1].to_i <= bounds[1][1].to_i)
  end
end
