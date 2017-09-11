module GatesTest where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports



import QC


testGateX::TestTree
testGateX=testCase "Test X-Gate correct values"
    (assertEqual "X-Gate values," (Gate (((2><2)[0,1,1,0]::Matrix C))) (xGate))


testGateY::TestTree
testGateY=testCase "Test Y-Gate correct values"
    (assertEqual "Y-Gate values," (Gate (((2><2) [0.0,0.0:+(-1.0),0.0:+1.0,0.0]::Matrix C)))  (yGate))



testGateZ::TestTree
testGateZ=testCase "Test Z-Gate correct values"
    (assertEqual "Z-Gate values," (Gate (((2><2) [1,0,0,-1]::Matrix C))) (zGate))

testGateI::TestTree
testGateI=testCase "Test Identity Matrix correct values"
    (assertEqual "I-Gate values," (Gate (((2><2) [1,0,0,1]::Matrix C))) (iGate))

testGateH::TestTree
testGateH=testCase "Test H-Gate correct values"
    (assertEqual "H-Gate values," (Gate (((2><2) [1/sqrt 2,1/sqrt 2,1/sqrt 2,(-1)/sqrt 2]::Matrix C))) (hGate))



--rGate::Double->Matrix(Complex Double)
--rGate t=complexMatrix [[cos t,-sin t],[sin t, cos t]]   

testGateControlledPhaseShift::TestTree
testGateControlledPhaseShift=testCase "Test Controlled Phase Shift correct values"
    (assertEqual "Controlled Phase Shift Gate values," (Gate (((4><4)[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,-1]::Matrix C)))
     (cPhaseShifGate))



testGateControlledNot::TestTree
testGateControlledNot=testCase "Test Controlled Not Shift correct values"
    (assertEqual "Controlled Phase Not Gate values," (Gate (((4><4)[1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0]::Matrix C)))
        (cNotGate))

testGateSwap::TestTree
testGateSwap=testCase "Test Swap correct values"
    (assertEqual "Swap Gate values," (Gate (((4><4)[1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1]::Matrix C)))
     (swapGate))

                                           

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
    
