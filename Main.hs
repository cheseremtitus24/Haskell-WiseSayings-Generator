module Main where
import FileReader
import System.IO
import Control.Monad
-- main :: IO ()
main = do
  let filename = "wisesayings.txt"
  handle <- openFile filename ReadMode
  contents <- hGetContents handle
  -- print contents
  quoteList <- makeQuotes contents
  -- print quoteList
  -- show contents
  putStrLn "\n\nWise Quote - Play to Get Luckily More Wiser !!"
  doLoop quoteList
  hClose handle


-- Capture users query Word
doLoop quoteList = do
  putStrLn "Enter a Word to Get a coinciding Quote ? Otherwise, Press q to Exit"
  userWord <- getLine
  -- check that userWord is not an empty String
  if userWord == ""
    then do
      putStrLn "Plese Feed me a Word "
      doLoop quoteList
      else if userWord == "q"
        then  putStrLn "GoodBye!!"
        else do
          putStrLn "\nWorker is skimming for a relevant quote .... \n\n"

          -- do
          relevantQuotes <- identifyQuotes quoteList userWord

          -- print (relevantQuotes)
          my_quote <- randomPicker relevantQuotes
          print my_quote

          -- randomPicker relevantQuotes

          -- putStrLn ("  "++relevantQuotes)
          -- doLoop quoteList
        -- putStrLn "GoodBye!!"
