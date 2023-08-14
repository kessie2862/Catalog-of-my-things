require_relative 'classes/author'
require_relative 'classes/item'
require_relative 'classes/game'

puts "Hi! Welcome to the Catalog of my things app.\n\n"

# Create instances and perform other setup as needed

loop do
  puts "Please choose an option:"
  puts "1. List of games"
  puts "2. List all authors"
  puts "3. Add a game"
  puts "10. Exit"

  selected_option = gets.chomp

  case selected_option
  when '1'
    # List of games
    puts "List of games:"
    # Iterate through games and print details
    # Replace `games` with the actual collection of Game objects
    games.each do |game|
      puts "Title: #{game.title}, Genre: #{game.genre}, Author: #{game.author.full_name}, Last Played At: #{game.last_played_at}"
    end
  when '2'
    # List all authors
    # Your code to list authors here
  when '3'
    def create_a_game(title = nil, author = nil)
      if title.nil? && author.nil?
        puts 'Title'
        title = gets.chomp
        puts 'Author'
        author = gets.chomp
      end
    end
  
  when '10'
    puts "Hope you had fun. See you again 😊"
    break
  else
    puts "Invalid option ⛔. Please enter a number between 1 and 10"
  end
end
