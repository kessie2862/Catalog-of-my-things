require_relative '../classes/GAme/author'  
require_relative '../classes/item'   

RSpec.describe Author do
  describe '#to_h' do
    it 'returns a hash representation of the author' do
      author = Author.new('John', 'Doe')
      expected_hash = {
        'id' => author.id,
        'first_name' => 'John',
        'last_name' => 'Doe',
        'items' => []
      }
      
      expect(author.to_h).to eq(expected_hash)
    end
  end

  describe '#add_item' do
    it 'adds an item to the author' do
      author = Author.new('Jane', 'Smith')
      item = Item.new('2022-01-01')  
      author.add_item(item)
      
      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end
  end

  describe '#other_data' do
    it 'returns a hash with first_name and last_name' do
      author = Author.new('Alice', 'Johnson')
      expected_data = {
        'first_name' => 'Alice',
        'last_name' => 'Johnson'
      }
      
      expect(author.other_data).to eq(expected_data)
    end
  end
end
