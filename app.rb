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
end
