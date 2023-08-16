require_relative '../classes/item'
require_relative '../classes/Book/label'
require_relative '../classes/Game/author'
require_relative '../classes/Music/genre'

RSpec.describe Item do
  describe 'constructor' do
    it 'sets the publish date and archived status' do
      publish_date = '2022-01-01'
      item = Item.new(publish_date, archived: true)
      expect(item.publish_date).to eq(publish_date)
      expect(item.archived).to be true
    end
  end

  describe '#add_author' do
    it 'associates the author with the item' do
      item = Item.new('2022-01-01')
      author = Author.new('John', 'Doe')
      item.add_author(author)
      expect(item.author).to eq(author)
      expect(author.items).to include(item)
    end
  end

  describe '#add_label' do
    it 'associates the label with the item' do
      item = Item.new('2022-01-01')
      label = Label.new('Label Name', 'red')
      item.add_label(label)
      expect(item.label).to eq(label)
      expect(label.items).to include(item)
    end
  end

  describe '#add_genre' do
    it 'associates the genre with the item' do
      item = Item.new('2022-01-01')
      genre = Genre.new('Science Fiction')
      item.add_genre(genre)
      expect(item.genre).to eq(genre)
      expect(genre.items).to include(item)
    end
  end
end
