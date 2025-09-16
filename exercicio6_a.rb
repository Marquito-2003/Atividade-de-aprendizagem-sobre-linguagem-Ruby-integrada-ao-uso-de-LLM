class Numeric
  @@currencies = {
    'dollar' => 1.0,
    'euro'   => 1.292,
    'rupee'  => 0.019,
    'yen'    => 0.013
  }

  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub(/s$/, '') # remove 's' do plural
    if @@currencies.has_key?(singular_currency)
      self_in_dollars = self * @@currencies[singular_currency]
      return CurrencyConverter.new(self_in_dollars)
    else
      super
    end
  end

  def respond_to_missing?(method_id, include_private = false)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    @@currencies.has_key?(singular_currency) || super
  end
end
class CurrencyConverter
  def initialize(amount_in_dollars)
    @amount_in_dollars = amount_in_dollars
  end
  def in(target_currency)
    singular_currency = target_currency.to_s.gsub(/s$/, '')
    rate = Numeric.class_variable_get(:@@currencies)[singular_currency]
    raise "Moeda não suportada: #{target_currency}" unless rate
    @amount_in_dollars / rate
  end
end

# ✅ Exemplos de uso:
puts 5.dollars.in(:euros)    # => aproximadamente 3.87
puts 10.euros.in(:rupees)    # => aproximadamente 680.0
puts 1.dollar.in(:yen)       # => aproximadamente 76.92
puts 100.rupees.in(:dollars) # => aproximadamente 1.9
