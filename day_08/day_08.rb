# frozen_string_literal: true

require 'matrix'
require 'debug'

##
# This class implements a solution for the Day Eight problem of the 2022 Advent
# of Code.
class Day08
  def initialize(test: false)
    @test = test
    @forest = nil
    @visible = 0
    @max_scenic_score = 0

    build_forest
    evaluate_trees
  end

  def build_forest
    @forest = problem_input.map(&:split).map { |trees| trees.first.chars.map(&:to_i) }
  end

  def columns
    @forest[0].count
  end

  def evaluate_trees
    (0...rows).to_a.each do |y|
      (0...columns).to_a.each do |x|
        @max_scenic_score = [@max_scenic_score, tree_scenic_score(x, y)].max
        @visible += 1 if tree_visible?(x, y)
      end
    end
  end

  def left_or_right_column?(y)
    y.zero? || y == columns - 1
  end

  def rows
    @forest.count
  end

  def scenic_score_bottom(x, y)
    count = 0
    ((x + 1)...rows).each do |row|
      count += 1 if row == (x + 1) || @forest[row][y] >= @forest[(row - 1)][y]
      break if @forest[row][y] >= @forest[x][y]
    end
    count
  end

  def scenic_score_left(x, y)
    count = 0
    (0..(y - 1)).to_a.reverse.each do |column|
      count += 1 if column == (y - 1) || @forest[x][column] >= @forest[x][(column + 1)]
      break if @forest[x][column] >= @forest[x][y]
    end
    count
  end

  def scenic_score_right(x, y)
    count = 0
    ((y + 1)...columns).each do |column|
      count += 1 if column == (y + 1) || @forest[x][column] >= @forest[x][(column - 1)]
      break if @forest[x][column] >= @forest[x][y]
    end
    count
  end

  def scenic_score_top(x, y)
    count = 0
    (0..(x - 1)).to_a.reverse.each do |row|
      count += 1 if row == (x - 1) || @forest[row][y] >= @forest[(row + 1)][y]
      break if @forest[row][y] >= @forest[x][y]
    end
    count
  end

  def solution
    "Part 1: #{@visible}, Part 2: #{@max_scenic_score}"
  end

  def top_or_bottom_row?(x)
    x.zero? || x == rows - 1
  end

  def tree_scenic_score(x, y)
    return 0 if left_or_right_column?(y) || top_or_bottom_row?(x)

    scenic_score_top(x, y) * scenic_score_bottom(x, y) *
      scenic_score_left(x, y) * scenic_score_right(x, y)
  end

  def tree_visible?(x, y)
    top_or_bottom_row?(x) || left_or_right_column?(y) ||
      visible_from_top?(x, y) || visible_from_bottom?(x, y) ||
      visible_from_left?(x, y) || visible_from_right?(x, y)
  end

  def visible_from_bottom?(x, y)
    ((x + 1)...rows).none? { |row| @forest[row][y] >= @forest[x][y] }
  end

  def visible_from_left?(x, y)
    (0...y).none? { |column| @forest[x][column] >= @forest[x][y] }
  end

  def visible_from_right?(x, y)
    ((y + 1)...columns).none? { |column| @forest[x][column] >= @forest[x][y] }
  end

  def visible_from_top?(x, y)
    (0...x).none? { |row| @forest[row][y] >= @forest[x][y] }
  end

  private

  def problem_input
    if @test
      [
        '30373',
        '25512',
        '65332',
        '33549',
        '35390'
      ]
    else
      input_file = "#{File.expand_path('.', __dir__)}/input.txt"
      File.readlines(input_file, chomp: true)
    end
  end
end
