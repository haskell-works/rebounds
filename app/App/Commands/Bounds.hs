{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications    #-}

module App.Commands.Bounds
  ( cmdBounds
  ) where

import Control.Lens
import Data.Generics.Product.Any
import Options.Applicative       hiding (columns)

import qualified App.Commands.Types as Z
import qualified Data.Text          as T
import qualified System.IO          as IO

runBounds :: Z.BoundsOptions -> IO ()
runBounds opts = do
  let inputFile = opts ^. the @"inputFile"
  IO.putStrLn $ "Input file: " <> inputFile
  return ()

optsBounds :: Parser Z.BoundsOptions
optsBounds = Z.BoundsOptions
  <$> strOption
        (   long "input"
        <>  short 'i'
        <>  help "Input JSON file"
        <>  metavar "FILE"
        )
cmdBounds :: Mod CommandFields (IO ())
cmdBounds = command "bounds"  $ flip info idm $ runBounds <$> optsBounds
