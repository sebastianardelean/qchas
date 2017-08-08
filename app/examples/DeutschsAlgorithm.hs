module DeutschsAlgorithm 
    (
        testDeutschsAlgorithm
    )where

import Numeric.LinearAlgebra hiding ( (|>) )

import Gates
import Qubits



-- Unitary transformation to represent quantum oracle of a function
--   f(x) = 0.
f1::Gate
f1=Gate ((4><4) [1,0,0,0
                ,0,1,0,0
                ,0,0,1,0
                ,0,0,0,1]::Matrix C)

-- Unitary transformation to represent quantum oracle of a function
--   f(x) = 1.
f2::Gate
f2=Gate ((4><4) [0,1,0,0
                ,1,0,0,0
                ,0,0,0,1
                ,0,0,1,0]::Matrix C)

-- Unitary transformation to represent quantum oracle of a function
--   f(x) = x.
f3::Gate
f3=Gate ((4><4) [1,0,0,0
                ,0,1,0,0
                ,0,0,0,1
                ,0,0,1,0]::Matrix C)
-- Unitary transformation to represent quantum oracle of a function
--   f(x) = not(x).
f4::Gate
f4=Gate ((4><4) [0,1,0,0
                ,1,0,0,0
                ,0,0,1,0
                ,0,0,0,1]::Matrix C)

-- Apply Deutsch's Algorithm on each oracle
testDeutschsAlgorithm::IO()
testDeutschsAlgorithm=mapM_ deutsch [f1,f2,f3,f4]


deutsch::Gate->IO()
deutsch oracle=do let (result:_)=measure circuit
                  case result of
                    '0' -> putStrLn "Function is constant"
                    '1' -> putStrLn "Function is balanced"
                    _   -> return()
    where
        gateHadamardOnTwoQubits=(hGate <+> hGate)
        circuit=entangle qZero (qZero |> xGate) |> gateHadamardOnTwoQubits |> oracle |> gateHadamardOnTwoQubits
        measure q=let result=map(\c->round (realPart (c * conjugate c))) (toList . flatten $ qubitState q)        
                  in case result of
                    [0,1,0,0]->"01"
                    [0,0,0,1]->"11"
                    _        ->"??"