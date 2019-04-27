class Node
  attr_reader :data
  attr_accessor :next_node
  def initialize(data)
    @data = data
    @next_node = nil
  end

  def tail?
    @next_node == nil
  end

  def add_node(data)
    if self.tail?
      @next_node = Node.new(data)
    end
  end
end
