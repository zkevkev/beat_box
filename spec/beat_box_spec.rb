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