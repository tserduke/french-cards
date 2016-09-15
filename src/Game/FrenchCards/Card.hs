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
  deriving (Eq, Ord, Read, Show)

-- | Card indexes from 0 to 51
instance Enum Card where
  {-# INLINE toEnum #-}
  toEnum x | x >= 0 && x < 52 = Card $ fromIntegral x
           | otherwise = error $ "Card toEnum " ++ show x
  {-# INLINE fromEnum #-}
  fromEnum = fromIntegral . cardWord

instance Bounded Card where
  {-# INLINE minBound #-}
  minBound = Card 0
  {-# INLINE maxBound #-}
  maxBound = Card 51


-- | Create new card
{-# INLINE newCard #-}
newCard :: Rank -> Suit -> Card
newCard r s = Card $ fromIntegral $ fromEnum r * 4 + fromEnum s


-- | Get card rank
{-# INLINE cardRank #-}
cardRank :: Card -> Rank
cardRank (Card x) = toEnum $ fromIntegral $ x `div` 4

-- | Get card suit
{-# INLINE cardSuit #-}
cardSuit :: Card -> Suit
cardSuit (Card x) = toEnum $ fromIntegral $ x `mod` 4

-- | Get underlying card word
{-# INLINE cardWord #-}
cardWord :: Card -> Word8
cardWord (Card x) = x
