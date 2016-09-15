module Game.FrenchCards.Card
  ( module Card
  , Card (Card)
  , newCard
  , cardRank
  , cardSuit
  , cardWord
  ) where

import Game.FrenchCards.Rank as Card
import Game.FrenchCards.Suit as Card

import Data.Word


newtype Card = Card Word8
  deriving (Enum, Eq, Ord, Read, Show)

instance Bounded Card where
  {-# INLINE minBound #-}
  minBound = Card 0
  {-# INLINE maxBound #-}
  maxBound = Card 51


{-# INLINE newCard #-}
newCard :: Rank -> Suit -> Card
newCard r s = Card $ fromIntegral $ fromEnum r * 4 + fromEnum s


{-# INLINE cardRank #-}
cardRank :: Card -> Rank
cardRank (Card x) = toEnum $ fromIntegral $ x `div` 4

{-# INLINE cardSuit #-}
cardSuit :: Card -> Suit
cardSuit (Card x) = toEnum $ fromIntegral $ x `mod` 4

{-# INLINE cardWord #-}
cardWord :: Card -> Word8
cardWord (Card x) = x
