# Scenario 1: Card Games
# Create `Card`,  `Deck`, and `Player` objects to represent a deck of playing cards!
# 1. A `Card` has a suit (diamonds, hearts, clubs, spades) and a `value` (A-K-Q-J, 10-2), as well as a way to read those data points.
# 1. A `Deck` has at least 5 `Card`s, and can pull a `random_card` out of itself.
# 1. A `Player` has up to 8 cards in its `hand`, and can list the cards in their hand in order of value descending (e.g. `A of Diamonds, J of Hearts, 7 of Spades, 3 of Clubs`)

require_relative '../lib/card'

RSpec.describe Card do
   describe '#initialize' do
      it 'initialize a card' do
         card = Card.new('Hearts', 'A')
   end
end