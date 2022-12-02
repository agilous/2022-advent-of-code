# frozen_string_literal: true

require 'debug'

class Day02
  def initialize
    @part1_score = 0
    @part2_score = 0
  end

  def needed_score(line)
    return 0 if need_loss?(line)
    return 3 if need_draw?(line)
    return 6 if need_win?(line)

    raise 'BOOM!!!'
  end

  def played_score(line)
    if ['A X', 'B Z', 'C Y'].include?(line)
      3
    elsif ['A Z', 'B Y', 'C X'].include?(line)
      2
    else
      1
    end
  end

  def solution
    File.readlines('./day_02/input.txt', chomp: true).each do |line|
      next if line.empty?

      @part1_score += (score_game(line) + play_bonus(line))
      @part2_score += (needed_score(line) + played_score(line))
    end

    "Part 1 Score: #{@part1_score}, Part 2 Score: #{@part2_score}"
  end

  private

  def play_bonus(line)
    return 1 if line[/X$/]
    return 2 if line[/Y$/]
    return 3 if line[/Z$/]

    raise 'BANG!!!'
  end

  def draw?(line)
    ['A X', 'B Y', 'C Z'].include?(line)
  end

  def loss?(line)
    ['A Z', 'B X', 'C Y'].include?(line)
  end

  def need_draw?(line)
    !!line[/Y$/]
  end

  def need_loss?(line)
    !!line[/X$/]
  end

  def need_win?(line)
    !!line[/Z$/]
  end

  def score_game(line)
    return 6 if win?(line)
    return 3 if draw?(line)
    return 0 if loss?(line)
  end

  def win?(line)
    ['A Y', 'B Z', 'C X'].include?(line)
  end
end
