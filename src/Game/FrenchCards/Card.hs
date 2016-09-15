module Game.FrenchCards.Card
  ( module Card
  , Card (Card)
  , newCard
  , cardRank
  , cardSuit
  ) where

import Game.FrenchCards.Rank as Card
import Game.FrenchCards.Suit as Card

import Data.Word


newtype Card = Card Word8
  deriving (Bounded, Enum, Eq, Ord, Read, Show)


newCard :: Rank -> Suit -> Card
newCard = undefined

cardRank :: Card -> Rank
cardRank = undefined

cardSuit :: Card -> Suit
cardSuit = undefined
