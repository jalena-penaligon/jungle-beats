class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    nodes = data.split
    nodes.each do |node|
      @list.append(node)
    end
    data
  end

  def count
    @list.count
  end

  def play
    `say -r 500 #{@list.to_string}`
  end
end
