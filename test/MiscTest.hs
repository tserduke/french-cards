module Main (main) where

import Test.Hspec

import Game.FrenchCards.Card

import Control.Exception (evaluate)


main :: IO ()
main = hspec $
    describe "Card" $ do
        it "minBound" $ do
            cardRank minBound `shouldBe` R2
            cardSuit minBound `shouldBe` Clubs
        it "maxBound" $ do
            cardRank maxBound `shouldBe` Ace
            cardSuit maxBound `shouldBe` Spades
        it "toEnum error" $ do
            evaluate (toEnum (-1) :: Card) `shouldThrow` errorCall "Card toEnum -1"
            evaluate (toEnum 52   :: Card) `shouldThrow` errorCall "Card toEnum 52"
