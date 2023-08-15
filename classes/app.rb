require 'JSON_data'
require_relative 'Game/game'
require_relative 'Game/author'
require_relative 'Book/book'
require_relative 'Book/label'
require_relative 'Music/genre_operation'
require_relative 'Music/music_operations'

class App
  attr_accessor :music_album_operations, :genre_operations

  def initialize
    @music_album_operations = MusicAlbumOperations.new
    @genre_operations = GenreOperations.new
    @games = []
    @authors = []
    @books = []
    @labels = []
  end

  def add_book
    book = Book.new(@input_data.publisher, @input_data.cover_state, @input_data.publish_date)
    data = read_file('JSON_data/books.json')
    @books = data
    @books << book
    write_file('JSON_data/books.json', @books)
    puts 'Add a book successfully'
  end

  def book_list
    data = read_file('JSON_data/books.json')
    return puts "there are no books.Let's add a book" if data.empty?

    data.each do |book|
      puts "publisher: #{book[:publisher]}, cover_state: #{book[:cover_state]}, published date: #{book[:publish_date]}"
    end
  end

  def labels_list
    data = read_file('JSON_data/labels.json')
    return puts 'there are no labels.' if data.empty?

    data.each do |label|
      puts "title: #{label[:title]}, color: #{label[:color]}"
    end
  end

  def add_game
    multiplayer = @input_data.input_multiplayer
    return if multiplayer != true && multiplayer != false

    last_played_at = @input_data.input_last_played_at
    publish_date = @input_data.input_publish_date
    add_author
    res = read_file('JSON_data/games.json')
    if !res.nil? && res.class != Array
      @games.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @games = res
    end
    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    write_file('JSON_data/games.json', @games)
    puts 'game created successfully'
  end

  def add_author
    first_name = @input_data.input_first_name
    last_name = @input_data.input_last_name
    res = read_file('JSON_data/authors.json')
    if !res.nil? && res.class != Array
      @authors.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @authors = res
    end
    @authors.push(Author.new(first_name, last_name))
    write_file('JSON_data/authors.json', @authors)
  end

  def game_list
    @games = read_file('JSON_data/games.json')
    puts 'Please create a game at first.' if @games.empty?
    @games.each do |game|
      print "multipayer: \"#{game[:multiplayer]}\", last_played_at: \""
      print "#{game[:last_played_at]}, publish_date: \"#{game[:publish_date]} "
      puts
    end
    puts ''
  end

  def author_list
    @authors = read_file('JSON_data/authors.json')
    @games = read_file('JSON_data/games.json')
    puts 'Please create a game at first.' if @games.empty?
    @authors.each do |author|
      puts "FirstName: \"#{author[:first_name]}\"    LastName: \"#{author[:last_name]} "
    end
    puts ''
  end

  # write file method
  def write_file(file, content)
    data = content.map(&:to_hash)
    json = JSON.pretty_generate(data)
    File.write(file, json)
  end

  # read file method
  def read_file(file_name)
    # Handle if file does not exist
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end
end
