-- | Card Ranks
module Game.FrenchCards.Rank where


-- | Rank type
data Rank = R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 | Jack | Queen | King | Ace
  deriving (Bounded, Enum, Eq, Ord, Read, Show)
