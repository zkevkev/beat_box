class BeatBox
  attr_reader :list

  def initialize(string_to_append = nil)
    @list = LinkedList.new
    @list.append(string_to_append) if string_to_append != nil
  end

  def append(string)
    beats = string.split(' ')
    passed_beats = whitelist_filter(beats)
    passed_beats.each do |beat|
      @list.append(beat)
    end
  end

  def prepend(string)
    beats = string.split(' ')
    passed_beats = whitelist_filter(beats)
    passed_beats.reverse.each do |beat|
      @list.prepend(beat)
    end
  end

  def count
    @list.count
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

  def play
    beats = @list.to_string
    `say -r 500 -v Boing "#{beats}"`
  end
end