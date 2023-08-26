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
    
    if @head == nil
      @head = new_node
    else
      current_node = @head
      (position - 1).times do
        if current_node == nil
          break
        end
      current_node = current_node.next_node
      end

      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end
end

#insert will will iterate until finding given position 
#and append node there

#find will take an index position and play back the given 
#stretch of nodes

#pop same as pop

#includes? returns true false whether nodes include given string

#BeatBox LinkedList.new 