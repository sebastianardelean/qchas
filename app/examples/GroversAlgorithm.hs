module GroversAlgorithm 
  (
    testGroversAlgorithm
  )where


import Prelude hiding ( (|>),(<*>),(<+>),(<->) ) 
import Numeric.LinearAlgebra hiding ( (|>) )
import QC

phaseShift::Gate
phaseShift=Gate ((8><8)[1,0,0,0,0,0,0,0,
                        0,1,0,0,0,0,0,0,
                        0,0,1,0,0,0,0,0,
                        0,0,0,1,0,0,0,0,
                        0,0,0,0,1,0,0,0,    
                        0,0,0,0,0,1,0,0,
                        0,0,0,0,0,0,1,0,
                        0,0,0,0,0,0,0,-1]::Matrix C)

cnot::Gate
cnot=Gate ((16><16)[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
                    0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0 
                    ]::Matrix C)

runAlgorithm::Qubit
runAlgorithm=runAlgo
    where 
        firstStage=(qZero `entangle` qZero `entangle` qZero `entangle` qOne) |> ( hGate <*> hGate <*> hGate <*> hGate)
        secondStage=firstStage |> cnot
        thirdStage=secondStage |> (hGate <*> hGate <*> hGate <*> iGate)
        fourthStage=thirdStage |> (xGate <*> xGate <*> xGate <*> iGate)
        fifthStage= fourthStage |> (phaseShift <*> iGate)
        runAlgo=fifthStage |> ( hGate <*> hGate <*> hGate <*> hGate)


measureAlgo::Qubit->Qubit
measureAlgo q=measure q

testGroversAlgorithm::Qubit
testGroversAlgorithm=measure runAlgorithm
