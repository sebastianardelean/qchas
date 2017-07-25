module QubitsTest where


import Test.Tasty
import Test.Tasty.HUnit

--Library imports
import Data.Complex
import Data.List(transpose)
import Lib

import Utils
import Qubits



testQubitZero::TestTree
testQubitZero=testCase "Test |0> correct values"
    (assertEqual "|0> values," [1.0 :+ 0.0,0.0 :+ 0.0] (qZero))
    

testQubitOne::TestTree
testQubitOne=testCase "Test |1> correct values"
    (assertEqual "|1> values," [0.0 :+ 0.0,1.0 :+ 0.0] (qOne))


testQubitPlus::TestTree
testQubitPlus=testCase "Test |+> correct values"
    (assertEqual "|+> values," [0.7071067811865475 :+ 0.0,0.7071067811865475 :+ 0.0] (qPlus))    


testQubitMinus::TestTree
testQubitMinus=testCase "Test |-> correct values"
    (assertEqual "|-> values," [0.7071067811865475 :+ 0.0,(-0.7071067811865475) :+ 0.0]
 (qMinus))    

