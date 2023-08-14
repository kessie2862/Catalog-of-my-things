class Label
  attr_accessor :items, :name, :id

  def initialize(title, color)
    @id = Random.rand(1..500)
    @name = title
    @color = color
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.label = self
  end
end
