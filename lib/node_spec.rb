require 'minitest/autorun'
require 'minitest/spec'
require_relative 'node'

describe Node do
  before do
    @node = Node.new(name: '/')
  end

  describe '#initialize' do
    it 'sets the name' do
      assert_equal('/', @node.name)
    end

    it 'has no size' do
      assert_equal(0, @node.size)
    end

    it 'is a root node' do
      assert @node.root?
    end
  end

  describe '#add_node' do
    it 'creates and returns an immediate ancestor node' do
      path = '/foo'
      @node.add_node(path:)

      assert @node.find(path:)
      assert @node.find(path:).is_a?(Node)
    end

    it 'creates and returns a distant ancestor node' do
      path = '/foo/bar/baz'
      @node.add_node(path:)

      assert @node.find(path:)
      assert @node.find(path:).is_a?(Node)
    end
  end

  describe '#path' do
    it 'returns the path to the node' do
      path = '/foo/bar/baz'
      @node.add_node(path:)

      assert_equal path, @node.find(path:).path
    end
  end

  describe '#size' do
    it 'returns zero for empty root nodes' do
      assert_equal(0, Node.new(name: '/').size)
    end

    it 'returns the sum of the contents sizes of otherwise empty root nodes' do
      root_node = Node.new(name: '/')
      root_node.add_content(name: 'a.txt', size: 100)
      root_node.add_content(name: 'b.doc', size: 2000)

      assert_equal(2100, root_node.size)
    end

    it 'returns the sum of next directories with content' do
      root_node = Node.new(name: '/')
      root_node.add_content(name: 'a.txt', size: 10)
      root_node.add_content(name: 'b.doc', size: 2_000)
      foo_bar = root_node.add_node(path: '/foo/bar')
      foo_bar.add_content(name: 'x.xls', size: 300)
      baz = root_node.add_node(path: '/baz')
      baz.add_content(name: 'z.iso', size: 500_000)
      baz.add_content(name: 'y.pdf', size: 40_000)

      assert_equal(542_310, root_node.size)
    end
  end
end
