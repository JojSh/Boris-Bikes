class Van

  DEFAULT_CAPACITY = 15
  attr_reader :cargo, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @cargo = []
    @capacity = capacity
  end

  def load(collection)
    raise 'The van is full' if (@cargo.size + collection.size) > capacity
    @cargo << collection
    @cargo.flatten!
  end

  def spaces_left
    @capacity - @cargo.size 
  end

  def unload
    @cargo.pop(@cargo.length)
  end
end
