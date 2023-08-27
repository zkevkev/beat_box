class BeatBox
  attr_reader :list

  #figure out how to make a new object with an argument defined head node (iter#4)
  #research implementation of a whitelist (iter#4)
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
end