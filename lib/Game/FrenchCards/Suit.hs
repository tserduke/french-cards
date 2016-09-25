-- | Card Suits
module Game.FrenchCards.Suit where


-- | Suit type
data Suit = Clubs | Diamonds | Hearts | Spades
    deriving (Bounded, Enum, Eq, Ord, Show, Read)
