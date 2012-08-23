require 'test/unit'
require 'set'

class Tree
  attr_accessor :children, :node_name

  def initialize(struct={})
    @node_name = struct.keys[0]
    @children = struct[@node_name].collect { |k,v| Tree.new({ k => v })}
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

class TestTree < Test::Unit::TestCase

  def setup
    @fam = {
      "grandpa" => {
        "dad" => {"child1" => {}, "child2" => {}},
        "uncle" => {"child3" => {}, "child4" => {}}
      }
    }
    @num_nodes = 7
    @names = Set.new [
      "grandpa", "dad", "child1", "child2",
      "uncle", "child3", "child4"
    ]
  end

  def test_init
    tree = Tree.new @fam
    assert_equal tree.node_name, 'grandpa'
    assert_equal tree.children.length, 2
  end

  def test_visit
    tree = Tree.new @fam
    tree.visit do |gp|
      assert_equal tree.node_name, 'grandpa'
    end
  end

  def test_visit_all
    tree = Tree.new @fam
    visits = 0
    names = Set.new
    tree.visit_all do |p|
      names << p.node_name
      visits += 1
    end
    assert_equal visits, @num_nodes
    assert_equal names, @names
  end

end
