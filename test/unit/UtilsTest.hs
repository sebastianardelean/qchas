module UtilsTest where

import Test.Tasty
import Test.Tasty.HUnit


import Numeric.LinearAlgebra hiding ( (|>) )

import Qubits
import Gates
import Utils




testEntangle::TestTree
testEntangle=testCase "Test Entangle function"
    (assertEqual "|0>|0>," (Qubit (((4><1) [ 1.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  ]:: Matrix C))) (entangle qZero qZero))


testApplyGate::TestTree
testApplyGate=testCase "Test |> function"
    (assertEqual "|0> |> H," (Qubit (((2><1) [ 0.7071067811865475 :+ 0.0
                                     , 0.7071067811865475 :+ 0.0 ]::Matrix C))) (apply hGate qZero))

testApplyGateOperator::TestTree
testApplyGateOperator=testCase "Test |> function"
    (assertEqual "|0> |> H," (Qubit (((2><1) [ 0.7071067811865475 :+ 0.0
                                     , 0.7071067811865475 :+ 0.0 ]::Matrix C))) (qZero |> hGate))