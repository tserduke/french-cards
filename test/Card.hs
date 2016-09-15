module Main (main) where

import Test.HUnit

import Game.FrenchCards.Card

import Control.Monad (void)


main :: IO ()
main = void $ runTestTT tests


tests :: Test
tests = TestList
  [ TestList $ map getNew values
  , TestList [newGet r s | r <- values, s <- values]
  ]

getNew :: Card -> Test
getNew c = TestLabel ("getNew " ++ show c) $
  c ~=? newCard (cardRank c) (cardSuit c)

newGet :: Rank -> Suit -> Test
newGet r s = TestLabel ("newGet " ++ show r ++ " " ++ show s) $
  (r, s) ~=? (cardRank c, cardSuit c) where c = newCard r s


values :: (Bounded a, Enum a) => [a]
values = [minBound .. maxBound]
