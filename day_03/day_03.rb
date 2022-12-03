# frozen_string_literal: true

require 'debug'

class Day03
  def initialize
    @part1_sum = 0
    @part2_sum = 0
    @line_number = 0
    @lines = [nil, nil, nil]
  end

  def intersection(line)
    arrays = line.chars.each_slice(line.length / 2).to_a
    (arrays[0] & arrays[1]).first
  end

  def priority(lines)
    score((lines[0].chars & lines[1].chars & lines[2].chars).first)
  end

  def score(chr)
    ord = chr.ord
    ord <= 90 ? ord - 38 : ord - 96
  end

  def solution
    File.readlines('./day_03/input.txt', chomp: true).each do |line|
      raise 'BANG!!!' if line.empty?

      @lines[@line_number % 3] = line

      @part1_sum += score(intersection(line))
      @part2_sum += priority(@lines) if (@line_number % 3) == 2

      @line_number += 1
    end

    "Part 1 Priority Sum: #{@part1_sum}, Part 2 Sum: #{@part2_sum}"
  end
end
