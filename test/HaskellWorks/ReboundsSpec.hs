{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
{-# LANGUAGE ScopedTypeVariables #-}

module HaskellWorks.ReboundsSpec (spec) where

import HaskellWorks.Hspec.Hedgehog
import HaskellWorks.Rebounds
import Hedgehog
import Test.Hspec

import qualified Hedgehog.Gen   as G
import qualified Hedgehog.Range as R

{-# ANN module ("HLint: Ignore Redundant do" :: String) #-}
{-# ANN module ("HLint: Ignore Reduce duplication"  :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.ReboundsSpec" $ do
  it "Stub" $ requireProperty $ do
    True === True
