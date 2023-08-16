class Label
  attr_accessor :items, :name, :id, :title, :color

  def initialize(title, color)
    @id = Random.rand(1..500)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_h
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items.map(&:to_h)
    }
  end

  def other_data
    {
      'title' => @title,
      'color' => @color
    }
  end
end
