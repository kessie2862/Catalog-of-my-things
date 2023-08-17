require_relative '../classes/Game/game'
require_relative '../classes/item'

RSpec.describe Game do

  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago and item can be archived' do
      it 'returns true' do
        game = Game.new('2020-01-01', false, '2021-01-01')
        expect(game.can_be_archived?).to be false
      end
    end

    context 'when last played less than 2 years ago' do
      it 'returns false' do
        game = Game.new('2020-01-01', true, '2022-01-01')
        expect(game.can_be_archived?).to be false
      end
    end

    context 'when item cannot be archived' do
      it 'returns false' do
        game = Game.new('2023-01-01', true, '2020-01-01')
        expect(game.can_be_archived?).to be false
      end
    end
  end
end
