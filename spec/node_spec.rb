require "./lib/node"

RSpec.describe Node do
  it 'defines a new node' do
    node1 = Node.new("plop")

    expect(node1).to be_instance_of(Node)
  end

  it 'returns node data' do
    node1 = Node.new("plop")

    expect(node1.data).to eq("plop")
  end

  it 'has no linked nodes by default' do
    node1 = Node.new("plop")

    expect(node1.next_node).to be nil
  end
end