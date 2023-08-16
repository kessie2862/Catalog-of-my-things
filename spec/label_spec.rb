require_relative '../classes/Book/label'
require_relative '../classes/item'

RSpec.describe Label do
  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Test Label', 'red')
      item = Item.new(Date.new(2023, 8, 16))

      label.add_item(item)

      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end

    it 'does not add the same item again' do
      label = Label.new('Test Label', 'red')
      item = Item.new(Date.new(2023, 8, 16))

      label.add_item(item)
      label.add_item(item)

      expect(label.items).to eq([item])
    end
  end
end
