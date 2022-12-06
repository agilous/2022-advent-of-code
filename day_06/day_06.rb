# frozen_string_literal: true

require 'debug'

##
# This class implements a solution for the Day Six problem of the 2022 Advent of
# Code.
class Day06
  def initialize(test: false)
    @test = test
  end

  def marker(line, length = 4)
    start = 0
    marker_found = false

    while start < line.length - length
      marker_found = true if line[start, length].chars.uniq.count == length
      break if marker_found

      start += 1
    end

    return unless marker_found

    start + length
  end

  def solution
    "Part 1: #{marker(problem_input.first)}, Part 2: #{marker(problem_input.first, 14)}"
  end

  private

  def problem_input
    if @test
      %w[mjqjpqmgbljsphdztnvjfqwrcgsmlb]
    else
      input_file = "#{File.expand_path('.', __dir__)}/input.txt"
      File.readlines(input_file, chomp: true)
    end
  end
end