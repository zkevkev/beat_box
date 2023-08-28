class BeatBox
  attr_reader :list

  #whitelist needs to live in the LinkedList class somewhere (?)
  def initialize
    @list = LinkedList.new
  end

  def append(string)
    beats = string.split(' ')
    beats.each do |beat|
      @list.append(beat)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 500 -v Boing "#{beats}"`
  end

  def all
    @list.to_string
  end
end