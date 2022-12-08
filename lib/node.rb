# frozen_string_literal: true

require 'debug'

##
# This class implements a simple Tree data structure.
class Node
  attr_accessor :children, :contents, :name, :parent

  Content = Struct.new(:name, :content_size)

  def initialize(name:, parent: nil)
    @name = name
    @contents = []
    @children = []
    @parent = parent
  end

  def add_child(name:, parent:)
    children << Node.new(name:, parent:)
  end

  def add_content(name:, size:)
    contents << Content.new(name, size.to_i)
  end

  def add_node(path:)
    current_node = self

    path.split('/').each do |name|
      next if name.blank?

      unless current_node.children.any? { |child| child.name == name }
        current_node.add_child(name:, parent: current_node)
      end
      current_node = current_node.children.find { |child| child.name == name }
    end

    current_node
  end

  def find(path:)
    current_node = self
    path.split('/').each do |name|
      next if name&.empty?
      return current_node if current_node.path == path
      return nil unless current_node.children.any? { |child| child.name == name }

      current_node = current_node.children.find { |child| child.name == name }
    end

    current_node
  end

  def path
    p = [name]
    current_node = self
    until current_node.parent.nil?
      p << current_node.parent.name
      current_node = current_node.parent
    end

    p.take(p.length).reverse.join('/').gsub(%r{^//}, '/')
  end

  def root?
    parent.nil?
  end

  def size
    children.sum(&:size) + contents.sum(&:content_size)
  end
end
