class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    @flavor.downcase == "black licorice" ? false : true
  end
end

# ✅ Testando:
bolo = Dessert.new("Bolo de Chocolate", 350)
puts bolo.delicious?  # true
puts bolo.healthy?    # false

jelly = JellyBean.new("JellyBean", 150, "black licorice")
puts jelly.delicious? # false
puts jelly.healthy?   # true
