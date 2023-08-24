class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    node = Node.new(data)

    if @head == nil
      @head = node
    else
      until @head.next_node == nil do
       
      end
    end
  end
end

#append will make new node and assign to the head if no head exists

#head will give head node

#next_node will give tail node

#count will start and head position and iterate through 
#nodes until it returns nil (each node will only know the next node)

#insert will will iterate until finding given position 
#and append node there

#prepend will add a new head (ie it will append at position 0)

#find will take an index position and play back the given 
#stretch of nodes

#pop same as pop

#includes? returns true false whether nodes include given string

#BeatBox LinkedList.new 