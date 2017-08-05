{-|
 -Module      : Gates
 -Description : Basic Quantum Gates
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}

module Gates
    (
        xGate
      , yGate
      , zGate
      , hGate
      --, rGate
      , cPhaseShifGate
      , cNotGate
      , swapGate
      , Gate(..)
--      , gateMatrix
    )where


import Numeric.LinearAlgebra
import Qubits
import Prelude hiding ((<*>),(<+>))

data Gate=
  Gate {
          gateMatrix::Matrix C -- ^ Gate constructor accepts a parameter of type Matrix C
        } deriving (Eq,Show)

{-|
 -  xGate function represent a Pauli X-Gate
 
 >>>xGate
 (2><2)
 [ 0.0 :+ 0.0, 1.0 :+ 0.0
 , 1.0 :+ 0.0, 0.0 :+ 0.0 ]
 -}
xGate::Gate
xGate=Gate ((2><2)[0,1,1,0]::Matrix C)
    
{-|
 -  yGate function represent a Pauli Y-Gate
 
 >>>yGate
(2><2)
 [ 0.0 :+ 0.0, 0.0 :+ (-1.0)
 , 0.0 :+ 1.0,    0.0 :+ 0.0 ]
 -}
yGate::Gate
yGate=Gate ((2><2) [0.0,0.0:+(-1.0),0.0:+1.0,0.0]::Matrix C)

{-|
 -  zGate function represent a Pauli Z-Gate
 
 >>>zGate
 (2><2)
 [ 1.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, (-1.0) :+ (-0.0) ]
 -}
zGate::Gate
zGate=Gate ((2><2) [1,0,0,-1]::Matrix C)

{-|
 -  hGate function represent a Hadamard Gate
  
  >>>hGate
 (2><2)
 [ 0.7071067811865475 :+ 0.0,    0.7071067811865475 :+ 0.0
 , 0.7071067811865475 :+ 0.0, (-0.7071067811865475) :+ 0.0 ]
 -}
hGate::Gate
hGate=Gate ((2><2) [1/sqrt 2,1/sqrt 2,1/sqrt 2,(-1)/sqrt 2]::Matrix C)

    
{-|
 -  cPhaseShifGate function represent a Controlled Phase-Shift Gate
 
 >>>cPhaseShifGate
(4><4)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, (-1.0) :+ (-0.0) ]
 -}
cPhaseShifGate::Gate
cPhaseShifGate=Gate ((4><4)[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,-1]::Matrix C)

{-|
 -  cNotGate function represent a Controlled-Not Gate
 
 >>>cNotGate
 (4><4)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0 ]
 -}
cNotGate::Gate
cNotGate=Gate ((4><4)[1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0]::Matrix C)



{-|
 -  swapGate function represent a Swap Gate
 
 >>>swapGate
 (4><4)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0 ]
 -}
swapGate::Gate 
swapGate=Gate ((4><4)[1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1]::Matrix C)
