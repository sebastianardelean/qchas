module QuantumOperations where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports


import Prelude hiding ( (|>),(*),(<*>),(<+>),(<->) ) 
import QC

testEntangle::TestTree
testEntangle=testCase "Test Entangle function"
    (assertEqual "|0>|0>," (Qubit (((4><1) [ 1.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  ]:: Matrix C))) (entangle qZero qZero))


testApplyGateOperator::TestTree
testApplyGateOperator=testCase "Test |> function"
    (assertEqual "|0> |> H," (Qubit (((2><1) [ 0.7071067811865475 :+ 0.0
                                     , 0.7071067811865475 :+ 0.0 ]::Matrix C))) (qZero |> hGate))

testOuterProduct::TestTree
testOuterProduct=testCase "Test |><| function"
    (assertEqual "|0><0|," (Gate (((2><2)[ 1.0 :+ 0.0, 0.0 :+ 0.0 , 0.0 :+ 0.0, 0.0 :+ 0.0 ]::Matrix C))) (qZero |><| qZero))


testMultiplyWithConstant::TestTree
testMultiplyWithConstant=testCase "Test `mul` function"
    (assertEqual "|0> * 5," (Qubit (((2><1)[ 5.0 :+ 0.0, 0.0 :+ 0.0 ]::Matrix C))) (qZero * 5))    

    

testMultiplyGateOperator::TestTree
testMultiplyGateOperator=testCase "Test Kronecker product operator"
    (assertEqual "zGate <*> zGate" (Gate (((4><4)
      [1,0,0,0,0,(-1),0,0,0,0,(-1),0,0,0,0,1]::Matrix C))) (zGate <*> zGate))
    
