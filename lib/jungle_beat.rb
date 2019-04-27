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

end
