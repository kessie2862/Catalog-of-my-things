require_relative 'app'

APP_OPTIONS = {
  '1' => 'Add a new book',
  '2' => 'List all books',
  '3' => 'List all labels',
  '4' => 'Add a music album',
  '5' => 'List all music albums',
  '6' => 'List all genres',
  '7' => 'Add a game',
  '8' => 'List all games',
  '9' => 'List all authors',
  '10' => 'Quit'
}.freeze

class StartMessage
  def self.print_once
    @printed ||= false
    return if @printed

    puts "Welcome to the Catalog of my things app!\n\n"
    @printed = true
  end
end

class AppRunner
  def initialize
    @app = App.new
  end

  def run
    StartMessage.print_once

    loop do
      display_options
      user_choice = gets.chomp.to_s
      break if process_choice(user_choice) == 'quit'
    end

    puts 'Hope you had fun. Hope to see you again 😊'
  end

  private

  def display_options
    puts 'Please choose an option by entering a number.'
    APP_OPTIONS.each { |index, string| puts "#{index} - #{string}" }
  end

  def process_choice(choice)
    case choice
    when '1' then @app.add_book
    when '2' then @app.list_all_books
    when '3' then @app.list_all_labels
    when '4' then @app.add_music_album
    when '5' then @app.list_all_music_albums
    when '6' then @app.list_all_genres
    when '7' then @app.add_game
    when '8' then @app.list_all_games
    when '9' then @app.list_all_authors
    when '10' then 'quit'
    else
      puts 'Invalid option ⛔. Please enter a number between 1 and 10'
    end
  end
end

AppRunner.new.run
