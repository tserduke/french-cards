module Game.FrenchCards.Suit where


data Suit = C | D | H | P
  deriving (Bounded, Enum, Eq, Ord, Show, Read)
