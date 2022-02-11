
module FileReader
    (
    makeQuotes,identifyQuotes,randomPicker
    ) where
      -- import qualified Data.Text as Text
      -- import qualified Data.Text.IO as Text
      import System.Random
      import Data.List
      import Data.Typeable
      -- Test:
      -- map ("foo" `denseSubListOf`) ["kungfoo!", "-f-o-o-"] == [True,False]

      [] `denseSubListOf` _ = True
      _  `denseSubListOf` [] = False
      xs `denseSubListOf` ys =
        let ps = zip xs ys in
        (length ps == length xs && all (uncurry (==)) ps) -- same prefix of xs and ys
        || xs `denseSubListOf` tail ys                  -- or search further



      -- sentenceSplit::(Char -> Bool) -> String -> [String]
      sentenceSplit sentence delimiter =  case dropWhile sentence delimiter of
                      "" -> []
                      delimiter' -> w : sentenceSplit sentence delimiter''
                            where (w, delimiter'') = break sentence delimiter'
      --- Typical usage
      --- sentence "Hello\n world"
      -- wordsWhen (=='\n') sentence
      -- > ['Hello','world']




      -- makeQuotes::String->[[String]]
      makeQuotes contents = do
        let quoteList = sentenceSplit (=='\n') contents
        return quoteList


      -- identifyQuotes::[Char]-> [Char] -> [Char]

      identifyQuotes quoteList userWord = do
        -- print (typeOf quoteList)
        -- let actualList = quoteList
        -- let mycustomquotes = ["hello","to","The","World"]
        -- let relevantQuotes = filter (userWord `denseSubListOf`) mycustomquotes
        let relevantQuotes = filter (userWord `denseSubListOf`) quoteList
        -- relevantQuotes <- filter (userWord `denseSubListOf`) quoteList

        -- let relevantQuotes = ["hello","to","The","World"]
        return relevantQuotes
        -- return mycustomquotes

      -- getElematIndex::[String]->Int->[String]
      getElematIndex relevantQuotes num = do
        let relevantQuote = relevantQuotes!!num
        return relevantQuote


      -- randomPicker::[String]->IO [[Char]]
      randomPicker relevantQuotes = do
        let quote_length = length relevantQuotes
        let list_quote_length = quote_length - 1
        num <- randomRIO (0::Int, list_quote_length )
        relevantQuote <- getElematIndex relevantQuotes num
        return relevantQuote
