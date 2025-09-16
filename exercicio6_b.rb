
class String
  def contador
    palavras = self.downcase.scan(/\b[a-z]+\b/)
    palavras.tally
  end
end

# Testando:
puts "A man, a plan, a canal -- Panama".contador
# => {"a"=>3, "man"=>1, "plan"=>1, "canal"=>1, "panama"=>1}
