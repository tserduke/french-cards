-- | Card Suits
module Game.FrenchCards.Suit where


data Suit = Clubs | Diamonds | Hearts | Spades
  deriving (Bounded, Enum, Eq, Ord, Show, Read)
