require 'rspec'
require_relative '../classes/Music/genre'
require_relative '../classes/item'

describe Genre do
  let(:genre) { Genre.new('Action') }
  let(:item) { Item.new('2000-01-01') }

  describe '#add_item' do
    it 'adds the item to the items array' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'does not add the item if it is already in the items array' do
      genre.add_item(item)
      genre.add_item(item)
      expect(genre.items.count(item)).to eq(1)
    end

    it 'sets the genre for the item' do
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end
