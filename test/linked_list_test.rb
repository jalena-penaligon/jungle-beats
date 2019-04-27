require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/linked_list'
require './lib/node'


class LinkedListTest < Minitest::Test

  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_starts_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_append_adds_node_to_list
    list = LinkedList.new
    list.append("doop")

    assert_equal Node, list.head.class
    assert_equal "doop", list.head.data
    assert_nil list.head.next_node
  end

  def test_count_returns_number_of_items_on_list
    list = LinkedList.new
    list.append("doop")

    assert_equal 1, list.count
  end

  def test_you_can_add_another_node
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_equal "deep", list.head.next_node.data
    assert_equal "doop deep", list.to_string
  end

  def test_to_string_returns_data_of_full_list
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("da")

    assert_equal "doop deep da", list.to_string
  end

  def test_tail_returns_last_node
    list = LinkedList.new
    list.append("doop")

    actual = list.tail(list.head)

    assert_equal Node, actual.class
    assert_equal "doop", actual.data
  end

  def test_empty_returns_true_when_no_nodes
    list = LinkedList.new

    assert list.empty?

    list.append("doop")
    refute list.empty?
  end

  def test_prepend_adds_to_front_of_list
    list = LinkedList.new
    list.append("plop")

    assert_equal "plop", list.to_string

    list.append("suu")
    list.prepend("dop")

    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count
  end

  def test_insert_adds_at_a_given_spot
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
  end

  def test_find_returns_node_data
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.prepend("deep")
    list.append("blop")
    list.insert(1, "woo")

    assert_equal "deep woo shi shu blop", list.to_string

    assert_equal "shi", list.find(2, 1)
    assert_equal "woo shi shu", list.find(1, 3)
  end

  def test_includes_returns_true_when_node_is_present
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.prepend("deep")
    list.append("blop")
    list.insert(1, "woo")

    assert list.includes?("deep")
    refute list.includes?("dep")
  end

  def test_pop_removes_last_node
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.prepend("deep")
    list.append("blop")
    list.insert(1, "woo")
    assert_equal "blop", list.pop
    assert_equal "shu", list.pop

    assert_equal "deep woo shi", list.to_string
  end

end
