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

  def count 
    current_node = @head
    node_counter = 1
   
    if current_node == nil
      node_counter = 0
    else
      until current_node.next_node == nil do
        current_node = current_node.next_node
        node_counter += 1
      end
    end
    
    node_counter
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
    length.times do
      if current_node == nil
        break
      end
      string_output += current_node.data
      if current_node.next_node != nil
        string_output += " "
      end
      current_node = current_node.next_node
    end
    
    string_output
  end
end

#find will take an index position and play back the given 
#stretch of nodes

#pop same as pop

#includes? returns true false whether nodes include given string

#BeatBox LinkedList.new 