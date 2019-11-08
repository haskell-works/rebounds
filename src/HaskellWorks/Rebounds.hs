{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Rebounds
  ( lineComment
  , scn
  , sc
  , lexeme
  , pItem
  ) where

import Control.Monad        (void)
import Data.Text            (Text)
import Data.Void
import Text.Megaparsec
import Text.Megaparsec.Char

import qualified Data.Text                  as T
import qualified Text.Megaparsec.Char.Lexer as L

type Parser = Parsec Void Text

lineComment :: Parser ()
lineComment = L.skipLineComment "#"

scn :: Parser ()
scn = L.space space1 lineComment empty

sc :: Parser ()
sc = L.space (void $ some (char ' ' <|> char '\t')) lineComment empty

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

pItem :: Parser String
pItem = lexeme (some (alphaNumChar <|> char '-')) <?> "list item"

keyword :: Text -> Parser ()
keyword = void . lexeme . string

common :: Parser ()
common = keyword "common"

commonName :: Parser Text
commonName = lexeme (fmap T.pack go) <?> "variable"
  where go :: Parser String
        go = ((:) <$> letterChar <*> many alphaNumChar)
