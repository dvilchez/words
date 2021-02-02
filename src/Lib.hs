module Lib
    ( someFunc,
      solve
    ) where

import Data.List (isInfixOf)
import Data.Maybe (catMaybes)

type Grid = [String]

someFunc :: IO ()
someFunc = outputGrid $ solve grid languages

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: Grid -> String
formatGrid = unlines

findWords :: Grid -> [String] -> [String]
findWords grid words =
  let foundWords = map (findWord grid) words
  in catMaybes foundWords

findWord :: Grid -> String -> Maybe String
findWord grid word =
  let lines = grid ++ (map reverse grid)
      found = or $ map (findWordInline word) lines
  in if found then Just word else Nothing

findWordInline :: String -> String -> Bool
findWordInline = isInfixOf

solve :: Grid -> [String] -> [String]
solve crossword patterns = findWords crossword patterns

grid = [ "__C________R___"
       , "__SI________U__"
       , "__HASKELL____B_"
       , "__A__A_____S__Y"
       , "__R___B___C____"
       , "__PHP____H_____"
       , "____S_LREP_____"
       , "____I__M_Y__L__"
       , "____L_E__T_O___"
       , "_________HB____"
       , "_________O_____"
       , "________CN_____"
       ]

languages = [ "BASIC"
            , "COBOL"
            , "CSHARP"
            , "HASKELL"
            , "LISP"
            , "PERL"
            , "PHP"
            , "PYTHON"
            , "RUBY"
            , "SCHEME"
            ]
