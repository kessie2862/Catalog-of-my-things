require_relative 'app'

APP_OPTIONS = {
  '1' => 'Add a new book',
  '2' => 'List all books',
  '3' => 'List all labels',
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

      case user_choice
      when '1' then @app.add_book
      when '10'
        puts 'Hope you had fun. Hope to see you again 😊'
        break
      else
        puts 'Invalid option ⛔. Please enter a number between 1 and 10'
      end
    end
  end

  private

  def display_options
    puts 'Please choose an option by entering a number.'
    APP_OPTIONS.each { |index, string| puts "#{index} - #{string}" }
  end
end

AppRunner.new.run
