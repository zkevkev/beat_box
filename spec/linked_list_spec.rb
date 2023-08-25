require "./lib/node"
require "./lib/linked_list"

RSpec.describe LinkedList do 
  it 'has no head when created' do
    list = LinkedList.new

    expect(list.head).to be nil
  end

  it 'will append a node to the head if linked list has no head' do
    list = LinkedList.new
    list.append("doop")

    expect(list.head).to be_instance_of(Node)
  end

  it 'will append a node to the next position if head exists' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.head.data).to eq("doop")
  end

  it 'will append to next position if a head exists' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.head.next_node.data).to eq("deep")
  end

  xit 'can count the number of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.count).to eq(2)
  end

  xit 'can make the linked list into a string' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.to_string).to eq("doop deep")
  end
end