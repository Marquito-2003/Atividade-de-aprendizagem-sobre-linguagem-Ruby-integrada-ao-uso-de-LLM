
def combine_anagrams(words)
  # Cria um hash onde a chave é a palavra ordenada (em minúsculas)
  grupos = Hash.new { |hash, key| hash[key] = [] }

  words.each do |word|
    chave = word.downcase.chars.sort.join
    grupos[chave] << word
  end

  grupos.values
end

# Exemplo de uso:
entrada = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
resultado = combine_anagrams(entrada)
p resultado
