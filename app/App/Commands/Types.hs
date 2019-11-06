{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DuplicateRecordFields #-}

module App.Commands.Types
  ( BoundsOptions(..)
  ) where

import GHC.Generics

data BoundsOptions = BoundsOptions
  { inputFile  :: FilePath
  } deriving (Eq, Show, Generic)
