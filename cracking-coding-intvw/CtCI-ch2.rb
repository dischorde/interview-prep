class Node
  # node for singly linked list
  def initialize(val)
    @val = val
    @next = nil
  end
end

# O(n) time O(n) space version, takes in the head node of a linked list
def remove_dups(head)
  seen = Set.new
  crawler = head
  prev = nil
  until crawler.nil?
    if seen.include?(crawler.val)
      prev.next = crawler.next
    else
      seen.add(crawler.val)
      prev = crawler
    end
    crawler = crawler.next
  end
  head
end

# O(n^2) time O(1) space version
def remove_dups_2(head)
  check = head
  until check.nil?
    crawler = check
    until crawler.next.nil?
      if check.val == crawler.next.val
        cralwer.next = cralwer.next.next
      else
        crawler = crawler.next
      end
    end
    check = check.next
  end
  head
end
