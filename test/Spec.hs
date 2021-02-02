import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "crossword solver" $ do
    it "Should detect left to right words" $ do
      elem "HASKELL" (solve grid languages) `shouldBe` True
      elem "PHP" (solve grid languages) `shouldBe` True
    it "Should detect right to left word" $ do
      elem "PERL" (solve grid languages) `shouldBe` True

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
