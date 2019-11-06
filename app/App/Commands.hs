module App.Commands
  ( commands
  ) where

import App.Commands.Bounds
import Data.Semigroup      ((<>))
import Options.Applicative

commands :: Parser (IO ())
commands = commandsGeneral

commandsGeneral :: Parser (IO ())
commandsGeneral = subparser $ mempty
  <>  commandGroup "Commands:"
  <>  cmdBounds
