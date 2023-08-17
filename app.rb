require_relative 'classes/Book/book'
require_relative 'classes/Book/label'
require_relative 'classes/Music/music_album'
require_relative 'classes/Music/genre'
require_relative 'classes/Game/game'
require_relative 'classes/user_data_storage'
require_relative 'classes/common_info_data'
require 'json'

class App
  include CommonInfoData

  def initialize
    @data_storage = DataStorage.new
    @data_storage.generate_json_files
  end

  def add_book
    book = create_book
    save_item('books.json', book)
    puts "You've successfully added a new book! 👍"
  end

  def add_music_album
    music_album = create_music_album
    save_item('music_albums.json', music_album)
    puts "You've successfully added a music album 👍"
  end

  def add_game
    game = create_game
    save_item('games.json', game)
    puts "You've successfully added a new game! 👍"
  end

  def list_all_books
    list_items('books.json', '[Book]')
  end

  def list_all_music_albums
    list_items('music_albums.json', '[Music Album]')
  end

  def list_all_games
    list_items('games.json', '[Game]')
  end

  def list_all_labels
    list_items('labels.json', '[Label]') do |label, index|
      "#{index + 1}. Title: #{label['title']}, Label Color: #{label['color']}"
    end
  end

  def list_all_genres
    list_items('genres.json', '[Genre]') { |genre| genre['name'] }
  end

  def list_all_authors
    list_items('authors.json', '[Author]') do |author|
      "First Name: #{author['first_name']}, Last Name: #{author['last_name']}"
    end
  end

  private

  def create_book
    puts 'Date Published (dd/mm/yy):'
    publish_date = gets.chomp
    publisher = get_user_input("Publisher's name:")
    cover_state = get_user_input('State of book cover (Good or bad):')
    Book.new(publish_date, publisher, cover_state).tap do |book|
      assign_metadata(book)
    end
  end

  def create_music_album
    publish_date = get_user_input('Enter published date (dd/mm/yy):')
    on_spotify = get_user_input('Is it on Spotify? (yes/no):').downcase == 'yes'
    MusicAlbum.new(publish_date, on_spotify: on_spotify).tap do |music_album|
      assign_metadata(music_album)
    end
  end

  def create_game
    last_played_at = get_user_input('Last played at (dd/mm/yy):')
    multiplayer = get_user_input('Is it multiplayer? (yes/no):').downcase == 'yes'
    publish = get_user_input('Date published:')
    Game.new(publish, multiplayer, last_played_at).tap do |game|
      assign_metadata(game)
    end
  end

  def assign_metadata(item)
    author = get_author('JSON_data/authors.json', item)
    label = get_label('JSON_data/labels.json', item)
    genre = get_genre('JSON_data/genres.json', item)
    item.author = author
    item.label = label
    item.genre = genre
  end

  def save_item(filename, item)
    item_hash = item.to_h.merge({
                                  'author' => item.author,
                                  'label' => item.label,
                                  'genre' => item.genre
                                })
    @data_storage.save_user_json_data("JSON_data/#{filename}", item_hash)
  end

  def list_items(filename, item_type)
    items = @data_storage.get_user_json_data("JSON_data/#{filename}")
    items.each_with_index do |item, index|
      item_details = block_given? ? yield(item, index) : default_item_details(item)
      puts "\n#{item_type} #{item_details}"
    end
    puts "\n\n"
  end

  def default_item_details(item)
    "Author: #{item['author']['first_name']}, Label: #{item['label']['title']}, Genre: #{item['genre']['name']}"
  end

  def get_user_input(prompt)
    print "#{prompt} "
    gets.chomp
  end
end
