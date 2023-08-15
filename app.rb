require_relative 'classes/Book/book'

class App
  def add_book
    puts 'Date Published (dd/mm/yy) :'
    publish_date = gets.chomp
    puts "Publisher's name :"
    publisher = gets.chomp
    puts 'State of book cover (Good or bad) :'
    cover_state = gets.chomp
    Book.new(publish_date, publisher, cover_state)
    puts "You've successfully added a new book! 👍"
  end

  def add_music_album
    print 'Enter published date (YYYY-MM-DD): '
    published_date = gets.chomp
    print 'Is it on Spotify? (yes/no): '
    on_spotify = gets.chomp.downcase == 'yes'
    print 'Enter genre: '
    genre_name = gets.chomp

    genre = @genres.find { |g| g.name == genre_name }
    unless genre
      genre = Genre.new(genre_name)
      @genres << genre
    end

    album = MusicAlbum.new(Date.parse(published_date), on_spotify: on_spotify)
    genre.add_item(album)

    puts 'Music album created successfully'
  end

  def add_game
    print 'Last played at (YYYY-MM-DD): '
    last_played_at = Date.parse(gets.chomp)
    print 'Is it multiplayer? (yes/no): '
    multiplayer = gets.chomp.downcase == 'yes'

    puts 'Enter game details:'
    print 'Game title: '
    title = gets.chomp
    print 'Game author: '
    author = gets.chomp
    print 'Game genre: '
    gets.chomp
    game = Game.new(multiplayer, last_played_at, Date.today)
    game.label = title
    game.add_author(author)
    game.add_genre(game_genre)

    @games << game

    puts 'Game added successfully'
  end
end
