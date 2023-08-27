class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)

    if @head == nil
      @head = new_node
    else
      current_node = @head

      until current_node.next_node == nil do
       current_node = current_node.next_node
      end

      current_node.next_node = new_node
    end
  end

  #should try to solve this recursively if you have time (needs research)
  def count 
    current_node = @head
    node_counter = 0
   
    if current_node == nil
      node_counter
    else
      node_counter += 1
      until current_node.next_node == nil do
        current_node = current_node.next_node
        node_counter += 1
      end
      node_counter
    end
  end

  def to_string
    string_conversion = ""
    current_node = @head

    until current_node == nil do
      string_conversion += current_node.data
      string_conversion += " " if current_node.next_node != nil
      current_node = current_node.next_node
    end

    string_conversion
  end

  def prepend(data)
    new_node = Node.new(data)

    if @head == nil
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def insert(position, data)
    new_node = Node.new(data)
    
    if @head == nil || position == 0
      new_node.next_node = @head
      @head = new_node
    else
      current_node = @head
      (position - 1).times do
        if current_node == nil
          break
        end
      current_node = current_node.next_node
      end

      if current_node != nil
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
      end
    end
  end

  def find(start_position, length)
    if @head == nil
      ""
    end

    current_node = @head
    start_position.times do
      if current_node == nil
        break
      end
    current_node = current_node.next_node
    end
    
    string_output = ""
    length_counter = 1
    length.times do
      if current_node == nil
        break
      end
      string_output += current_node.data
      if current_node.next_node != nil && length_counter < length
        string_output += " "
      end
      current_node = current_node.next_node
      length_counter += 1
    end
    
    string_output
  end

  def includes?(query)
    current_node = @head
    
    until current_node == nil
      if current_node.data == query
        return true
      end
      current_node = current_node.next_node
    end

    return false
  end

  def pop
    if @head == nil
      return
    end

    removed_data = ""

    if @head.next_node == nil
      removed_data += @head.data
      @head = nil
    else
      current_node = @head
      until current_node.next_node.next_node == nil do
        current_node = current_node.next_node
      end
      removed_data += current_node.next_node.data
      current_node.next_node = nil
    end

    removed_data
  end
end