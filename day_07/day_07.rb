# frozen_string_literal: true

require_relative '../lib/node'
require 'debug'

##
# This class implements a solution for the Day Seven problem of the 2022 Advent
# of Code.
class Day07
  def initialize(test: false)
    @test = test
    @tree = Node.new(name: '/')
    @cwd = '/'
  end

  def process_cd(dir)
    @cwd = case dir
           when '/'
             dir
           when '..'
             pieces = @cwd.split('/')
             pieces.length == 1 ? '/' : pieces.take(pieces.length - 1).join('/')
           else
             "#{@cwd}/#{dir}"
           end.gsub(%r{^//}, '/')
  end

  def process_command(command)
    case command
    when /^\$\s+cd\s+(.*)/
      process_cd(Regexp.last_match(1))
    when /^\$\s+ls\s*/
      # no op for now
    when /^dir\s+(.*)/
      process_dir(Regexp.last_match(1))
    when /^(\d+)\s+(\S+)/
      process_content(Regexp.last_match(2), Regexp.last_match(1))
    else
      raise 'BANG!'
    end
  end

  def process_content(name, size)
    @tree.find(path: @cwd).add_content(name:, size:)
  end

  def process_dir(name)
    parent = @tree.find(path: @cwd)
    parent.add_child(name:, parent:)
  end

  def traversal_sum(part_two: false)
    maximum = 100_000
    visited = []
    current_node = @tree

    loop do
      current_visit = { path: current_node.path, size: current_node.size }
      visited << current_visit unless visited.include?(current_visit)

      unvisited = current_node.children.reject { |child| visited.find { |v| v[:path] == child.path } }
      break if current_node.root? && unvisited.none?

      current_node = unvisited.empty? ? current_node.parent : unvisited.first
    end

    needed = visited.max_by { |v| v[:size] }[:size] - (70_000_000 - 30_000_000)
    if part_two
      visited.select { |v| v[:size] > needed }.min_by { |v| v[:size] }[:size]
    else
      visited.sum { |v| v[:size] > needed ? 0 : v[:size] }
    end
  end

  def solution
    problem_input.each { |command| process_command(command) }

    "Part 1: #{traversal_sum}, Part 2: #{traversal_sum(part_two: true)}"
  end

  private

  def problem_input
    if @test
      [
        '$ cd /',
        '$ ls',
        'dir a',
        '14848514 b.txt',
        '8504156 c.dat',
        'dir d',
        '$ cd a',
        '$ ls',
        'dir e',
        '29116 f',
        '2557 g',
        '62596 h.lst',
        '$ cd e',
        '$ ls',
        '584 i',
        '$ cd ..',
        '$ cd ..',
        '$ cd d',
        '$ ls',
        '4060174 j',
        '8033020 d.log',
        '5626152 d.ext',
        '7214296 k'
      ]
    else
      input_file = "#{File.expand_path('.', __dir__)}/input.txt"
      File.readlines(input_file, chomp: true)
    end
  end
end