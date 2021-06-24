{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Monad (mapM_)
import           Data.Int (Int64)
import           Data.Text (Text)
import qualified Data.Text as T
import           Database.SQLite.Simple
import           Database.SQLite.Simple.FromRow
import           Database.SQLite.Simple.FromField
import           Database.SQLite.Simple.ToField
import           Database.SQLite.Simple.Internal
import           Database.SQLite.Simple.Ok

data Kazu =
  Kazu { kazuCount :: Int64 } deriving (Show)

instance FromRow Kazu where
  fromRow = Kazu <$> field

listPrint x = do
    if x == [] then
        return ()
    else do
        let y = head x
        let (id, comment) = y
        putStrLn((show id) ++ " " ++ (show comment))
        listPrint (tail x)

main :: IO ()
main = do
  conn <- open "test.db"
  memos <- query_ conn "SELECT id, comment from memos;"
  kazu <- query_ conn "select count(*) from memos;" :: IO [Kazu]
  close conn

  let memos2 = memos :: [(Int, Text)]

  putStrLn ("id comment")
  listPrint memos2

  print kazu

  let (Kazu { kazuCount = k }) = kazu !! 0 
  print k
