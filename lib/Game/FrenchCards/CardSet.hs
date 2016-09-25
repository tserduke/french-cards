module Game.FrenchCards.CardSet where

import Data.Word (Word64)


newtype CardSet = CardSet Word64
    deriving (Eq, Ord, Read, Show)
