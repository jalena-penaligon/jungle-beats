require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new("plop")

    assert_instance_of Node, node
  end

  def test_it_has_data
    node = Node.new("plop")

    assert_equal "plop", node.data
  end

  def test_next_node_is_nil
    node = Node.new("plop")

    assert_nil node.next_node
  end

  def test_tail_returns_true_if_next_node_is_nil
    node = Node.new("plop")

    assert node.tail?
  end

  def test_you_can_add_a_node_to_next_node
    node = Node.new("plop")
    node.add_node("deep")

    assert_equal Node, node.next_node.class
    assert_equal "deep", node.next_node.data
    assert_nil node.next_node.next_node
  end
end
