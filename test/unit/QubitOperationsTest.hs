module QubitOperationsTest where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports



import QC


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

testOuterProduct::TestTree
testOuterProduct=testCase "Test |><| function"
    (assertEqual "|0><0|," (Gate (((2><2)[ 1.0 :+ 0.0, 0.0 :+ 0.0 , 0.0 :+ 0.0, 0.0 :+ 0.0 ]::Matrix C))) (qZero |><| qZero))

testMultiplyWithConstant::TestTree
testMultiplyWithConstant=testCase "Test `mul` function"
    (assertEqual "|0> `mul` 5," (Qubit (((2><1)[ 5.0 :+ 0.0, 0.0 :+ 0.0 ]::Matrix C))) (qZero `mul` 5))    

    
