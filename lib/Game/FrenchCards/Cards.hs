-- | Efficient representation of cards as bits.
module Game.FrenchCards.Cards where

import Game.FrenchCards.Card
import Game.FrenchCards.Suit

import Data.Bits (popCount)
import Data.Foldable (foldl')
import Data.Word (Word64)
import GHC.Exts (IsList, IsString)


newtype Cards = Cards Word64
    deriving (Eq, Ord, Read, Show)

instance Monoid Cards
instance IsList Cards
instance IsString Cards


{-# INLINE cardsWord #-}
cardsWord :: Cards -> Word64
cardsWord (Cards x) = x


{-# INLINE cardsNum #-}
cardsNum :: Cards -> Int
cardsNum = popCount . cardsWord


haveCard :: Cards -> Card -> Bool
haveCard = undefined


haveCards :: Cards -- ^ set
          -> Cards -- ^ subset
          -> Bool
haveCards = undefined


addCard :: Cards -> Card -> Cards
addCard = undefined

removeCard :: Cards -> Card -> Cards
removeCard = undefined


filterSuit :: Suit -> Cards -> Cards
filterSuit = undefined


{-# INLINE fromList #-}
fromList :: [Card] -> Cards
fromList = foldl' addCard mempty

toList :: Cards -> [Card]
toList = undefined
