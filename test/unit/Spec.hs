module Main where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports
import Data.Complex
import Data.List(transpose)



import Qubits


import QubitsTest
import GatesTest
import MeasurementPerformerTest

main = do
  defaultMain (testGroup "Unit tests" [
    testQubitZero,testQubitOne,testQubitMinus,testQubitPlus,
    testGateX, testGateY,testGateZ,testGateH,testGateControlledPhaseShift,testGateControlledNot,testGateI,
    testEntangle,testApplyGate,testApplyGateOperator,testMultiplyGateOperator,testMultiplyWithConstant,
    testMeasure,testOuterProduct,testAddGateFunction,testSubGateFunction
    ])
