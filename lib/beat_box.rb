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
    #need to figure out how to define length, could use very large number 
    #since #find will not add any non-existent positions (needs research)
    #could likely be done using another method
    beats = @list.find(0, )
    #this is definitely not the way to do this. Go to sleep!
    binding.pry
    `say -r 500 -v Boing "#{beats}"`
  end
end