class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, genre, author, source, label, publish_date, archived, multiplayer, last_played_at)
    super(id, genre, author, source, label, publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end 

  def can_be_archived?
    super && (last_played_at < (Date.today - 365 * 2))
  end
  def add_item(item)
     @items ||= [] # Initialize the collection if it doesn't exist
    @items << item
    item.game = self # Set the game property of the item
  end
end
