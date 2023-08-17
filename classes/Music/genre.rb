class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = rand(0..500)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end

  def to_h
    {
      'name' => @name,
      'items' => @items.map(&:to_h)
    }
  end

  def other_data
    {
      'name' => @name
    }
  end
end
