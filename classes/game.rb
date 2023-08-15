require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  def can_be_archived?
    super && (last_played_at < (Date.today - (365 * 2)))
  end

  def add_item(item)
    @items ||= [] # Initialize the collection if it doesn't exist
    @items << item
    item.game = self # Set the game property of the item
  end
end
