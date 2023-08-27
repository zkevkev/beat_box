require "./lib/beat_box"
require "./lib/linked_list"
require "./lib/node"

RSpec.describe BeatBox do
  it 'can be initialized' do
    bb = BeatBox.new

    expect(bb).to be_instance_of(BeatBox)
  end

  it 'has an empty LinkedList object by default' do
    bb = BeatBox.new

    expect(bb.list).to be_instance_of(LinkedList)
    expect(bb.list.head).to be nil
  end
end

describe "#count" do
  it 'will count the nodes in @list' do
    bb = BeatBox.new

    bb.list.append("doop")
    bb.list.append("deep")
    bb.list.append("boop")
#this needs a better test, this test is essentially hardcoded
    expect(bb.count).to eq(bb.list.count)
  end
end

describe "#append" do
  it 'can append multiple nodes using one command' do
    bb = BeatBox.new

    bb.append("deep doo ditt")

    expect(bb.list.head.data).to eq("deep")
    expect(bb.list.head.next_node.data).to eq("doo")
    expect(bb.count).to eq(3)
  end

  it 'can append multiple nodes more than once' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")

    expect(bb.list.head.data).to eq("deep")
    expect(bb.count).to eq(6)
  end
end

describe "#play" do
  it 'has sick beats' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")

    #figure out how to even test this
  end
end