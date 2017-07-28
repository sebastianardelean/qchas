module Main where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports
import Data.Complex
import Data.List(transpose)



import Qubits


import QubitsTest
import UtilsTest
import GatesTest

main = do
  defaultMain (testGroup "Unit tests" [
    testQubitZero,testQubitOne,testQubitMinus,testQubitPlus,
    testGateX, testGateY,testGateZ,testGateH,testGateControlledPhaseShift,testGateControlledNot,
    testEntangle,testApplyGate,testApplyGateOperator,testMultiplyGate
    ])