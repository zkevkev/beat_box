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

    expect(list.head).not_to be nil
  end

  it 'will append a node to the next position if head exists' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.head.data).to eq("doop")
  end

  it 'will not append to head if a head exists' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.head.data).not_to eq("deep")
  end

  it 'can count the number of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.count).to eq(2)
  end

  
end