
module Enumerable
  def palindrome?
    arr = self.to_a
    arr == arr.reverse
  end
end

puts [1, 2, 3, 2, 1].palindrome?      # true
puts [1, 2, 3].palindrome?            # false
puts %w[a b a].palindrome?            # true
puts (1..5).palindrome?               # false
puts (1..1).palindrome?               # true
