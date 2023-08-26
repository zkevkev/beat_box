require "./lib/node"
require "./lib/linked_list"
require "pry"

RSpec.describe LinkedList do 
  it 'can be initialized' do
    list = LinkedList.new

    expect(list).to be_instance_of(LinkedList)
  end
  
  it 'has no head when created' do
    list = LinkedList.new

    expect(list.head).to be nil
  end
end

describe "#append" do
  it 'will append a node to the head if linked list has no head' do
    list = LinkedList.new
    list.append("doop")

    expect(list.head.data).to eq("doop")
    expect(list.head.next_node).to be nil
  end

  it 'will append to tail position if a head exists' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.head.next_node.data).to eq("deep")
  end

  it 'will still append to tail if there are multiple nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("beep")

    expect(list.head.next_node.next_node.data).to eq("beep")
  end
end

describe "#count" do
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
end

describe "#to_string" do
  it 'can make the linked list into a string with spaces between node data' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("beep")

    expect(list.to_string).to eq("doop deep beep")
  end

  it 'will return an empty string if list is empty' do
    list = LinkedList.new

    expect(list.to_string).to eq("")
  end
end

describe "#prepend" do
  it 'will add nodes to the head position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.prepend("beep")

    expect(list.to_string).to eq("beep doop deep")
  end

  it 'will add nodes to the head position if list is empty' do
    list = LinkedList.new
   
    list.prepend("beep")

    expect(list.to_string).to eq("beep")
  end
end

describe "#insert" do
  it 'can insert a node at a specific position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(1, "beep")

    expect(list.to_string).to eq("doop beep deep")
  end

  it 'can insert a node at another position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")

    list.insert(2, "beep")

    expect(list.to_string).to eq("doop deep beep")
  end

  it 'can insert a node at the head' do 
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(0, "beep")

    expect(list.to_string).to eq("beep doop deep")
  end
end