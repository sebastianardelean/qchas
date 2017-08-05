module MeasurementPerformer
    (
        measureQubit
    ) 
    where

import Numeric.LinearAlgebra hiding ( (|>) )
import Prelude hiding ((<*>),(<+>))
import System.Random
import Data.List

import Qubits
import Gates
import Utils

--Constants used in code
randomListLength=1000
randomSeed=(-958036805781772734)


measureQubit::Qubit->Qubit
measureQubit q=createQubit  
    where
        qubitStates=collapseStates q
        qubitStatesLength=length qubitStates
        createQubit=Qubit( (qubitStatesLength><1) qubitStates::Matrix C)
            
        
collapseStates::Qubit->[Complex Double]
collapseStates q=measure 
    where
        result=map(\c-> realPart (c * conjugate c)) (toList . flatten $ qubitState q) 
        index=elemIndices (maximum result) result
        measure=let complexList=map(\i->realToFrac i:+0.0) result
                in [if x==head index then 1.0:+0.0 else 0.0:+0.0 |x<-[0.. (length complexList)-1]]

--randomList::Int->[Double]
--randomList seed=take randomListLength $ randoms (mkStdGen seed)::[Double]

--getRandomValue::Double
--getRandomValue=head $ randomList (randomSeed)


--intervalCount::Qubit->Integer
--intervalCount q=0

--collapseQubitState::Integer->Qubit->Qubit
--collapseQubitState pos q=qZero