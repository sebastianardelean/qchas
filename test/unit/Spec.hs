module Main where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports
import Data.Complex
import Data.List(transpose)
import Lib

import Utils
import Qubits


import QubitsTest
import UtilsTest

main = do
  defaultMain (testGroup "Unit tests" [
    testQubitZero,testQubitOne,testQubitMinus,testQubitPlus,
    testComplexVector

    ])