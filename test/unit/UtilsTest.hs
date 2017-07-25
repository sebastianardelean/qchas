module UtilsTest where

import Test.Tasty
import Test.Tasty.HUnit

import Data.Complex
import Data.List(transpose)

import Utils


testComplexVector::TestTree
testComplexVector=testCase "Test complexVector function"
    (assertEqual "Create Complex Vector," [1.0 :+ 0.0,0.0 :+ 0.0] (complexVector[1,0]))