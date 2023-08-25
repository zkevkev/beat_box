require "./lib/node"
require "./lib/linked_list"
require "pry"

RSpec.describe LinkedList do 
  it 'has no head when created' do
    list = LinkedList.new

    expect(list.head).to be nil
  end

  it 'will append a node to the head if linked list has no head' do
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

  it 'can count the number of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.count).to eq(2)
  end

  it 'can count the number of nodes if only a head exists' do
    list = LinkedList.new
    list.append("doop")

    expect(list.count).to eq(1)
  end

  it 'will count no nodes if LinkedList object is empty' do
    list = LinkedList.new

    expect(list.count).to eq(0)
  end

  it 'can make the linked list into a string' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("beep")

    expect(list.to_string).to eq("doop deep beep")
  end

  it 'can add nodes to the head position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.prepend("beep")

    expect(list.to_string).to eq ("beep doop deep")
  end

  it 'can insert a node at a specific position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(1, "beep")

    expect(list.to_string).to eq("doop beep deep")
  end

  xit 'can insert a node at another position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(2, "beep")

    expect(list.to_string).to eq("doop deep beep")
  end

  xit 'can insert a node at the head' do 
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(0, "beep")

    expect(list.to_string).to eq("beep doop deep")
  end
end