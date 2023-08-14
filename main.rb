puts "Hi! Welcome to the Catalog of my things app.\n\n"

loop do
  puts 'Please choose an option.'
  selected_option = gets.chomp

  case selected_option
  when '10'
    puts 'Hope you had fun. See you again 😊'
    break
  else
    puts 'Invalid option ⛔. Please enter a number between 1 and 10'
  end
end
