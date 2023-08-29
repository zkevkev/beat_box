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

describe "#iterate_until_tail" do
  it 'will iterate starting at the head and ending at the tail' do
    list = LinkedList.new
    
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")
    list.append("shi")
    list.append("boo")

    expect(list.iterate_until_tail.data).to eq("boo")
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
  it 'will count the number of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    expect(list.count).to eq(2)
  end

  it 'will count the number of nodes if only a head exists' do
    list = LinkedList.new
    list.append("doop")

    expect(list.count).to eq(1)
  end

  it 'will count no nodes if LinkedList object is empty' do
    list = LinkedList.new

    expect(list.count).to eq(0)
  end

  it 'will count a large number of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")
    list.append("shi")
    list.append("boo")

    expect(list.count).to eq(6)
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

  it 'will convert just the head' do
    list = LinkedList.new
    list.append("doop")

    expect(list.to_string).to eq("doop")
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
  it 'can add a node at a specific position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(1, "beep")

    expect(list.to_string).to eq("doop beep deep")
  end

  it 'can add a node at another position' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")

    list.insert(2, "beep")

    expect(list.to_string).to eq("doop deep beep boop")
  end

  it 'can add a node at the head' do 
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(0, "beep")

    expect(list.to_string).to eq("beep doop deep")
  end

  it 'can add a node at the tail' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(2, "beep")

    expect(list.to_string).to eq("doop deep beep")
  end

  it 'will not add to a position that does not exist' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    list.insert(5, "beep")

    expect(list.to_string).to eq("doop deep")
  end
end

describe "#find" do
  it 'starts at a specific position and returns given length of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")

    expect(list.find(1, 2)).to eq("deep boop")
  end

  it 'can return the entire list' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")

    expect(list.find(0, 4)).to eq("doop deep boop beep")
  end

  it 'will not return any non-existent nodes if called to' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")

    expect(list.find(3, 4)).to eq("beep")
  end

  it 'will return an empty string if the list is empty' do
    list = LinkedList.new

    expect(list.find(0, 2)).to eq("")
  end
end

describe "#includes?" do
  it 'will determine whether specific data exists in a list' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")

    expect(list.includes?("deep")).to be true
  end

  it 'will return false if the list does not contain the queried data' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")

    expect(list.includes?("dep")).to be false
  end
end

describe "#pop" do
  it 'will remove the last node' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")

    list.pop

    expect(list.to_string).to eq("doop deep")
  end

  it 'will return the last node after it is removed' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")

    expect(list.pop).to eq("boop")
  end

  it 'will do nothing if the list is empty' do
    list = LinkedList.new

    expect(list.pop).to be nil
  end

  it 'will return removed data if list only has a head' do 
    list = LinkedList.new
    list.append("doop")

    expect(list.pop).to eq("doop")
  end
end