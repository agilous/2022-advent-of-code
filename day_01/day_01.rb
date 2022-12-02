# frozen_string_literal: true

class Day01
  def initialize
    @current = 0
    @counts = []
  end

  def solution
    File.readlines('./day_01/input.txt', chomp: true).each do |line|
      if line.empty?
        @counts << @current
        @current = 0
        next
      end

      @current += line.to_i
    end

    "Max is: #{@counts.max}, Top 3 Total is: #{@counts.max(3).sum}"
  end
end
