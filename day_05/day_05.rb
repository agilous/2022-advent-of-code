# frozen_string_literal: true

require 'debug'
require 'stringio'

class Day05
  def initialize
    @stacks = {}
    @part_two_stacks = nil
    @stack_lines = []
  end

  def build_stacks(stack_lines)
    stack_lines[-1].split.each { |stack_number| @stacks[stack_number] = [] }

    stack_lines.pop
    stack_lines.reverse_each do |stack_line|
      StringIO.new(stack_line).each(4).map(&:chomp).each_with_index do |crate, index|
        label = crate&.match(/\[([A-Z])\]/)&.send('[]', 1)
        @stacks[(index + 1).to_s] << label if label
      end
    end

    @part_two_stacks = Marshal.load(Marshal.dump(@stacks)) # Need a deep copy of the stacks!
  end

  def move(from_stack, to_stack)
    crate = @stacks[from_stack].pop
    @stacks[to_stack] << crate
  end

  def move_crates(instruction)
    return if instruction.empty?

    split_instructions = instruction.split
    number_to_move = split_instructions[1].to_i
    from_stack = split_instructions[3]
    to_stack = split_instructions[5]

    part_two_move(number_to_move, from_stack, to_stack)
    number_to_move.times { move(from_stack, to_stack) }
  end

  def part_one_solution
    @stacks.keys.map { |key| @stacks[key].last }.join
  end

  def part_two_move(number_to_move, from_stack, to_stack)
    moved_crates = @part_two_stacks[from_stack].pop(number_to_move)
    @part_two_stacks[to_stack] = @part_two_stacks[to_stack] + moved_crates
  end

  def part_two_solution
    @stacks.keys.map { |key| @part_two_stacks[key].last }.join
  end

  def solution
    stacks_parsed = false
    stacks_built = false

    File.readlines('./day_05/input.txt', chomp: true).each do |line|
      stacks_parsed = true if line.empty?

      if stacks_parsed
        build_stacks(@stack_lines) unless stacks_built
        stacks_built = true
        move_crates(line)
      else
        @stack_lines << line unless stacks_parsed
      end
    end

    "Part 1 Solution: #{part_one_solution}, Part 2 Solution: #{part_two_solution}"
  end
end
