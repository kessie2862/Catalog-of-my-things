class Label
  attr_accessor :items, :name, :id

  def initialize(title, color)
    @id = Random.rand(1..500)
    @name = title
    @color = color
    @items = []
  end
end
