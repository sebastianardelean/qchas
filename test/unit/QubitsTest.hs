module QubitsTest where


import Test.Tasty
import Test.Tasty.HUnit

--Library imports



import QC




testQubitZero::TestTree
testQubitZero=testCase "Test |0> correct values"
    (assertEqual "|0> values," (Qubit (((2><1) [1.0 :+ 0.0,0.0 :+ 0.0]::Matrix C))) (qZero))
    

testQubitOne::TestTree
testQubitOne=testCase "Test |1> correct values"
    (assertEqual "|1> values," (Qubit (((2><1) [0.0 :+ 0.0,1.0 :+ 0.0]::Matrix C))) (qOne))


testQubitPlus::TestTree
testQubitPlus=testCase "Test |+> correct values"
    (assertEqual "|+> values," (Qubit (((2><1) [0.7071067811865475 :+ 0.0,0.7071067811865475 :+ 0.0]::Matrix C))) (qPlus))    


testQubitMinus::TestTree
testQubitMinus=testCase "Test |-> correct values"
    (assertEqual "|-> values," (Qubit (((2><1) [0.7071067811865475 :+ 0.0,(-0.7071067811865475) :+ 0.0]::Matrix C))) (qMinus))    

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
