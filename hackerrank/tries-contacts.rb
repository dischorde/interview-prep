class Node 
  def initialize
    @is_word = false
    @children = Array.new(26)
    @num_words = 0
  end
  
  def add(word)
    add_letters(word, 0)
  end
  
  def find_count(word, idx)
    return @num_words if idx == word.length
    child = get_node(word[idx])
    return 0 unless child
    child.find_count(word, idx + 1)
  end
  
  protected
  
  def add_letters(word, idx)
    @num_words += 1
    if idx == word.length
      @is_word = true
      return
    end
    
    letter = word[idx]
    child = get_node(letter)
    unless child
      child = Node.new()
      set_node(letter, child)
    end
    
    child.add_letters(word, idx + 1)
  end
  
  private
  
  def find_index(letter)
    letter.ord - 'a'.ord
  end
  
  def get_node(letter)
    @children[find_index(letter)]
  end
  
  def set_node(letter, node)
    @children[find_index(letter)] = node
  end  

end

n = gets.strip.to_i
root = Node.new()

for a0 in (0..n-1)
    op,contact = gets.strip.split(' ')
    if op == 'add'
      root.add(contact)
    elsif op == 'find'
      puts root.find_count(contact, 0)
    end
end
