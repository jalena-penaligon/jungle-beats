require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/linked_list'
require './lib/jungle_beat'
require './lib/node'


class JungleBeatTest < Minitest::Test

  def test_it_exists
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
  end

  def test_list_is_an_empty_linked_list
    jb = JungleBeat.new
    jb.list

    assert_nil jb.list.head
  end

  def test_append_creates_multiple_nodes
    jb = JungleBeat.new
    jb.list
    jb.append("deep doo ditt")

    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data

    jb.append("woo hoo shu")
    assert_equal 6, jb.count
  end

end
