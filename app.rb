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
end
