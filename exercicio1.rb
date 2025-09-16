
# arquivo: teste.rb
def palindrome?(string)
  s = string.downcase.gsub(/[^a-z]/, "")
  s == s.reverse
end

puts palindrome?("ararb")

def contador?(string)
    palavras = string.downcase.scan(/\b[a-z]+\b/)
    contagem = palavras.tally
end
variavel = contador?("A man, a plan, a canal -- Panama")
puts variavel
