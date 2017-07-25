module GatesTest where

import Test.Tasty
import Test.Tasty.HUnit

--Library imports
import Data.Complex
import Data.List(transpose)
import Lib

import Utils
import Qubits
import Gates

testGateX::TestTree
testGateX=testCase "Test X-Gate correct values"
    (assertEqual "X-Gate values," [[0.0 :+ 0.0,1.0 :+ 0.0],[1.0 :+ 0.0,0.0 :+ 0.0]] (xGate))


testGateY::TestTree
testGateY=testCase "Test Y-Gate correct values"
    (assertEqual "Y-Gate values," [[0.0,0.0:+(-1.0)],[0.0:+1.0,0.0]]  (yGate))



testGateZ::TestTree
testGateZ=testCase "Test Z-Gate correct values"
    (assertEqual "Z-Gate values," [[1.0 :+ 0.0,0.0 :+ 0.0],[0.0 :+ 0.0,(-1.0) :+ 0.0]] (zGate))



testGateH::TestTree
testGateH=testCase "Test H-Gate correct values"
    (assertEqual "H-Gate values," [[0.7071067811865475 :+ 0.0,0.7071067811865475 :+ 0.0]
        ,[0.7071067811865475 :+ 0.0,(-0.7071067811865475) :+ 0.0]] (hGate))



--rGate::Double->Matrix(Complex Double)
--rGate t=complexMatrix [[cos t,-sin t],[sin t, cos t]]   

testGateControlledPhaseShift::TestTree
testGateControlledPhaseShift=testCase "Test Controlled Phase Shift correct values"
    (assertEqual "Controlled Phase Shift Gate values," 
        [
             [1.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0]
            ,[0.0 :+ 0.0,1.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0]
            ,[0.0 :+ 0.0,0.0 :+ 0.0,1.0 :+ 0.0,0.0 :+ 0.0]
            ,[0.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0,(-1.0) :+ 0.0]
        ] (cPhaseShifGate))



testGateControlledNot::TestTree
testGateControlledNot=testCase "Test Controlled Not Shift correct values"
    (assertEqual "Controlled Phase Not Gate values," 
        [
             [1.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0]
            ,[0.0 :+ 0.0,1.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0]
            ,[0.0 :+ 0.0,0.0 :+ 0.0,0.0 :+ 0.0,1.0 :+ 0.0]
            ,[0.0 :+ 0.0,0.0 :+ 0.0,1.0 :+ 0.0,0.0 :+ 0.0]
        ] (cNotGate))

