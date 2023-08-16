equire_relative 'Game/author'
require_relative 'Book/label'
require_relative 'Music/genre'

module CommonInfoData
  def get_user_input(prompt)
    print prompt
    gets.chomp.to_s
  end

  def add_item(file, item)
    data = DataStorage.new

    data.save_user_json_data(file, item.to_h)
    item.other_data
  end

  def get_author(file, item)
    first_name = get_user_input('Enter Author first name: ')
    last_name = get_user_input('Enter Author last name: ')

    author = Author.new(first_name, last_name)
    item.add_author(author)

    add_item(file, author)
  end

  def get_label(file, item)
    title = get_user_input('Enter Label title: ')
    color = get_user_input('Enter Label color: ')

    label = Label.new(title, color)
    item.add_label(label)

    add_item(file, label)
  end

  def get_genre(file, item)
    name = get_user_input('Enter Genre name: ')

    genre = Genre.new(name)
    item.add_genre(genre)

    add_item(file, genre)
  end
end
