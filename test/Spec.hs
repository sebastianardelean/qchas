module Main where

import Test.Tasty
import Test.Tasty.HUnit



--test1 = TestCase (assertEqual "for (foo 3)," (1,2) (foo 3))
test1::TestTree
test1 = testCase "Dummy test"
    (assertEqual "for (foo 3)," (1,2) (1,2))

main = do
  defaultMain (testGroup "Our Library Tests" [test1])


--module Main where

--import Test.Tasty
--import Test.Tasty.HUnit

--import Lib
--import MathLib

--main :: IO ()
--main = do
--  defaultMain (testGroup "Our Library Tests" [sayYoTest, add5Test])

--sayYoTest :: TestTree
--sayYoTest = testCase "Testing sayYo"
--  (assertEqual "Should say Yo to Friend!" "Yo Friend!" (sayYo "Friend"))

--add5Test :: TestTree
--add5Test = testCase "Testing add5"
--  (assertEqual "Should add 5 to get 10" 10 (add5 5))