class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    beats = string.split(' ')
    passed_beats = whitelist_filter(beats)
    passed_beats.each do |beat|
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

  def whitelist_filter(beats)
    whitelist = ["doop", "deep", "beep", "boop", "shi", "boo", "doo", "ditt", "woo", "hoo", "shu"]

    whitelisted_beats = beats.select do |beat|
      whitelist.include?(beat)
    end

    whitelisted_beats
  end
end