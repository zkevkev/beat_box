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

    expect(bb.count).to eq(3)
  end

  it 'will return 0 if the list is empty' do
    bb = BeatBox.new

    expect(bb.count).to eq(0)
  end

  it 'will count if there is only a head' do
    bb = BeatBox.new

    bb.list.append("doop")

    expect(bb.count).to eq(1)
  end
end

describe "#append" do
  it 'can append multiple nodes using one command' do
    bb = BeatBox.new

    bb.append("deep doo ditt")

    expect(bb.list.find(0, 3)).to eq("deep doo ditt")
    expect(bb.count).to eq(3)
  end

  it 'can append multiple nodes more than once' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")

    expect(bb.list.find(0 , 6)).to eq("deep doo ditt woo hoo shu")
    expect(bb.count).to eq(6)
  end

  it 'can add a large amount of beats in one argument' do
    bb = BeatBox.new
    
    bb.append("deep doo ditt woo hoo shu boo")

    expect(bb.list.find(0, 7)).to eq("deep doo ditt woo hoo shu boo")
    expect(bb.count).to eq(7)
  end

  it 'will only add whitelisted beats' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("Mississippi")

    expect(bb.all).to eq("deep doo ditt")
  end
end

describe "#play" do
  it 'has sick beats' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")

    expect(bb.respond_to?(:play)).to be true
    # bb.play
  end

  it 'can play sick beat at a different rate' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")
    bb.rate = 100

    expect(bb.rate).to eq(100)
    expect(bb.respond_to?(:play)).to be true
    # bb.play
  end

  it 'can play sick beats in another voice' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")
    bb.voice = "Cellos"

    expect(bb.voice).to eq("Cellos")
    expect(bb.respond_to?(:play)).to be true
    # bb.play
  end
end

describe "#all" do
  it 'returns the entire list of beats as a string' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.append("woo hoo shu")

    expect(bb.all).to eq("deep doo ditt woo hoo shu")
  end

  it 'returns an empty string if list is empty' do
    bb = BeatBox.new

    expect(bb.all).to eq("")
  end
end

describe "#whitelist_filter" do
  it 'will filter out non-applicable beats' do
    bb = BeatBox.new

    expect(bb.whitelist_filter(["doop", "deep", "Louisiana"])).to eq(["doop", "deep"])
  end
end

describe "#prepend" do
  it 'will add beats to the beginning of a list' do
    bb = BeatBox.new

    bb.append("deep doo ditt")
    bb.prepend("woo hoo shu")

    expect(bb.list.find(0, 6)).to eq("woo hoo shu deep doo ditt")
  end

  it 'will add beats to the beginning if the list is empty' do
    bb = BeatBox.new

    bb.prepend("woo hoo shu")

    expect(bb.list.find(0, 3)).to eq("woo hoo shu")
  end

  it 'will only add whitelisted beats to the list' do
    bb = BeatBox.new

    bb.prepend("woo hoo shu Mississippi")

    expect(bb.list.find(0, 4)).to eq("woo hoo shu")
  end
end

describe "#reset_rate" do
  it 'sets the rate to default' do
    bb = BeatBox.new

    bb.rate = 100
    bb.reset_rate

    expect(bb.rate).to eq(500)
  end
end

describe "#reset_voice" do
  it 'sets the voice to default' do
    bb = BeatBox.new

    bb.voice = "Cellos"
    bb.reset_voice

    expect(bb.voice).to eq("Boing")
  end
end