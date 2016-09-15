-- | Card
module Game.FrenchCards.Card
  ( module Game.FrenchCards.Rank
  , module Game.FrenchCards.Suit
  , Card (Card)
  -- * Construction
  , newCard
  -- * Accessors
  , cardRank
  , cardSuit
  , cardWord
  ) where

import Game.FrenchCards.Rank
import Game.FrenchCards.Suit

import Data.Word


-- | Card type
newtype Card = Card Word8
  deriving (Eq, Ord, Read, Show)

-- | @
-- minBound == newCard R2 Clubs
-- maxBound == newCard Ace Spades
-- @
instance Bounded Card where
  {-# INLINE minBound #-}
  minBound = Card 0
  {-# INLINE maxBound #-}
  maxBound = Card 51

-- | Indexes are from 0 to 51
instance Enum Card where
  {-# INLINE toEnum #-}
  toEnum x | x >= 0 && x < 52 = Card $ fromIntegral x
           | otherwise = error $ "Card toEnum " ++ show x
  {-# INLINE fromEnum #-}
  fromEnum = fromIntegral . cardWord


-- | Create a new card
{-# INLINE newCard #-}
newCard :: Rank -> Suit -> Card
newCard r s = Card $ fromIntegral $ fromEnum r * 4 + fromEnum s


-- | Get a card rank
{-# INLINE cardRank #-}
cardRank :: Card -> Rank
cardRank (Card x) = toEnum $ fromIntegral $ x `div` 4

-- | Get a card suit
{-# INLINE cardSuit #-}
cardSuit :: Card -> Suit
cardSuit (Card x) = toEnum $ fromIntegral $ x `mod` 4

-- | Get an underlying card word
{-# INLINE cardWord #-}
cardWord :: Card -> Word8
cardWord (Card x) = x
