module GateOperationsTest where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports



import QC


testMultiplyGateOperator::TestTree
testMultiplyGateOperator=testCase "Test Kronecker product operator"
    (assertEqual "zGate <+> zGate" (Gate (((4><4)
      [1,0,0,0,0,(-1),0,0,0,0,(-1),0,0,0,0,1]::Matrix C))) (zGate <+> zGate))


testAddGateFunction::TestTree
testAddGateFunction=testCase "Test addition operator"
    (assertEqual "zGate `addGate` zGate" (Gate (((2><2)
      [ 2.0 :+ 0.0,0.0 :+ 0.0, 0.0 :+ 0.0, (-2.0) :+ (-0.0) ]::Matrix C))) (zGate `addGate` zGate))

    
testSubGateFunction::TestTree
testSubGateFunction=testCase "Test subtraction operator"
    (assertEqual "zGate `subGate` iGate" (Gate (((2><2)
      [ 0.0 :+ 0.0,0.0 :+ 0.0, 0.0 :+ 0.0, (-2.0) :+ (-0.0) ]::Matrix C))) (zGate `subGate` iGate))
    
