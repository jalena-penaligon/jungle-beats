class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(node)
    if empty?
      @head = Node.new(node)
    else
      last_node = tail(@head)
      last_node.add_node(node)
    end
  end

  def empty?
    @head == nil
  end

  def count
    return 0 if @head == nil
    count_nodes(@head, 1)
  end

  def count_nodes(node, count)
    return count if node.tail?
    count_nodes(node.next_node, count += 1)
  end


  def to_string(node = @head, repeat = self.count)
    song = ""
    if !empty?
      repeat.times do
        song << node.data + " "
        node = node.next_node
      end
    end
    song.strip
  end

  def tail(node)
    return node if node.tail?
    tail(node.next_node)
  end

  def prepend(node)
    new_head = Node.new(node)
    new_head.next_node = @head
    @head = new_head
  end

  def insert(position, node)
    new_node = Node.new(node)
    previous_node = node_position(head, position - 1)
    following_node = node_position(head, position)
    previous_node.next_node = new_node
    new_node.next_node = following_node
  end

  def node_position(node, position, count = 0)
    return node if position == count
    node_position(node.next_node, position, count += 1)
  end

  def find(position, number)
    node_at_position = node_position(head, position, count = 0)
    to_string(node = node_at_position, repeat= number)
  end

  def includes?(data, node = @head)
    return true if node.data == data
    if node.next_node != nil
      next_node = node.next_node
      includes?(data, node = next_node)
    else
      false
    end
  end

  def pop
    new_tail = node_position(head, count - 2)
    old_tail = new_tail.next_node
    new_tail.next_node = nil
    old_tail.data
  end

end
