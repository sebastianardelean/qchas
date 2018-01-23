{-|
 -Module      : MeasurementPerformer
 -Description : Definition of qubit measure function
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Quantum.MeasurementPerformer
    (
        measure
    ) 
    where

import Numeric.LinearAlgebra --hiding ( (|>) )
import Prelude --hiding ((<*>),(<+>))
import System.Random
import Data.List

import Quantum.Qubits
import Quantum.Gates

--Constants used in code
noOfTests=1000
randomGeneratorSeed=(-958036805781772734)


{-|
  -  measure function is used to perform qubit measurement
  
  >>>measure circuit
  Qubit {qubitState = (4><1)
  [ 0.0 :+ 0.0
  , 1.0 :+ 0.0
  , 0.0 :+ 0.0
  , 0.0 :+ 0.0 ]}

 -} 
measure::Qubit->Qubit
measure q=createResultQubit
    where
        result=map(\c->(realPart (c*conjugate c),0)) (toList . flatten $ qubitState q)
        qubitStates=collapseQubitState $ runTest (toInteger noOfTests) result
        qubitStatesLength=length qubitStates
        createResultQubit=Qubit((qubitStatesLength><1) qubitStates::Matrix C)

-- Function is used to collapse qubit state after is measured
collapseQubitState::[(Double,Integer)]->[Complex Double]
collapseQubitState result=measure
    where
        index=elemIndices (maximum result) result
        measure=let complexList=map(\i@(f,x)->(realToFrac f:+0.0,x)) result
                in [if x==head index then 1.0:+0.0 else 0.0:+0.0 | x<-[0.. (length complexList)-1]]

-- Function is used to perform the tests on qubits
runTest::Integer->[(Double,Integer)]->[(Double,Integer)]
runTest 0 tx=tx
runTest n tx=do 
    let randomValue=getRandomValue randomGeneratorSeed  -- generate a random value
    runTest (n-1) $ selectInterval randomValue tx       -- test qubit states

-- Function will increment the tuple (f,x) for which f is greater than a randomly chosen value
selectInterval::Double->[(Double,Integer)]->[(Double,Integer)]
selectInterval randValue list=map (\p@(f, x) -> if f >= randValue then (f, x+1) else p) list


-- Function used to generate some random values
getRandomValue::Int->Double
getRandomValue seed=head (randoms (mkStdGen seed)::[Double])



