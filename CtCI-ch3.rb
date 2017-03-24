class MinStackWithArrays
  def initialize
    @stack = []
  end

  def push(value)
    if @stack.empty?
      @stack.push([value, value])
    else
      new_min = [value, @stack.last[1]].min
      @stack.push([value, new_min])
    end
    @stack
  end

  def pop
    @stack.pop[0]
  end

  def min
    @stack.last[1]
  end
end

class MinStackWithStack
  def initialize
    @stack = []
    @mins = []
  end

  def push(value)
    if @mins.empty? || @mins.last >= value
      @mins.push(value)
    end
    @stack.push
  end

  def pop
    popped = @stack.pop
    if min == popped
      @mins.pop
    end
    popped
  end

  def min
    @mins.last
  end
end


class SetOfStacks
  def initialize(threshold)
    @set = [[]]
    @last_stack_idx = 0
    @threshold = threshold
  end

  def push(val)
    add_stack if last_stack.length == @threshold
    last_stack.push(val)
  end

  def pop
    last_stack.pop
  end

  def pop_at(idx)
    @set[idx].pop
    # reorganize(idx) & return popped
  end

  private

  def add_stack
    @set.push([])
    @last_stack_idx += 1
  end

  def last_stack
    @set[@last_stack_idx]
  end

  # def reorganize(starting_idx)
  #   (starting_idx...@last_stack_idx).each do |cur|
  #     top = @set[cur + 1].shift
  #     @set[cur].push(top)
  #   end
  # end

end

# time O(n^2) space O(n)
def sort_stack(s1)
  working = []

  until s1.empty?
    check = s1.pop
    until working.empty? || working.last < check
      s1.push(working.pop)
    end
    working.push(check)
  end

  until working.empty?
    s1.push(working.pop)
  end

  s1
end


class Cat
  def initialize(name)
    @name = name
    # other things that would be in the cat class
  end
end

class Dog
  def initialize(name)
    @name = name
    # other things that would be in the dog class
  end
end

class AnimalNode
  attr_reader :timestamp, :type, :animal
  attr_accessor :next

  def initialize(animal)
    @animal = animal
    @timestamp = Time.now
    @next = nil
  end
end

class AnimalQueue
  def initialize
    @head_node = nil
    @tail_node = nil
  end

  def empty?
    @head_node.nil?
  end

  def enqueue(pet)
    pet_node = AnimalNode.new(pet)
    if empty?
      @head_node = pet_node
    else
      @tail_node.next = pet_node
    end
    @tail_node = pet_node
  end

  def peek_timestamp
    @head_node.timestamp
  end

  def dequeue
    raise "Queue is empty!" if empty?
    dequeued = @head_node
    if @head_node == @tail_node
      @head_node, @tail_node = nil, nil
    else
      @head_node = @head_node.next
    end
    dequeued.animal
  end
end

class AnimalShelter
  attr_reader :cats, :dogs

  def initialize
    @cats = AnimalQueue.new
    @dogs = AnimalQueue.new
  end

  def enqueue(pet)
    if pet.is_a?(Cat)
      @cats.enqueue(pet)
    elsif pet.is_a?(Dog)
      @dogs.enqueue(pet)
    else
      raise "Not a valid pet"
    end
  end

  def dequeue_any
    if @cats.empty? || @dogs.empty?
      @cats.empty? ? @dogs.dequeue : @cats.dequeue
    elsif @cats.peek_timestamp < @dogs.peek_timestamp
      @cats.dequeue
    else
      @dogs.dequeue
    end
  end

  def dequeue_cat
    @cats.dequeue
  end

  def dequeue_dog
    @dogs.dequeue
  end
end

# kitty = Cat.new("kitty")
# kitty1 = Cat.new("kitty1")
# kitty2 = Cat.new("kitty2")
# kitty3 = Cat.new("kitty3")
# kitty4 = Cat.new("kitty4")
# dog = Dog.new("dog")
# dog1 = Dog.new("dog1")
# dog2 = Dog.new("dog2")
# dog3 = Dog.new("dog3")
# dog4 = Dog.new("dog4")
#
# shelter = AnimalShelter.new
# shelter.enqueue(kitty)
# shelter.enqueue(kitty1)
# shelter.enqueue(dog)
# shelter.enqueue(kitty2)
# shelter.enqueue(dog1)
# shelter.enqueue(dog2)
# shelter.enqueue(kitty3)
# shelter.enqueue(dog3)
# shelter.enqueue(kitty4)
# shelter.enqueue(dog4)
