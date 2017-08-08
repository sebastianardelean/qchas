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
      , iGate
      --, rGate
      , cPhaseShifGate
      , cNotGate
      , swapGate
      , (<+>)
      --, (-)
      --, (+)
      , Gate(..)
--      , gateMatrix
    )where


import Numeric.LinearAlgebra
import Prelude hiding ((<*>),(<+>),(-))

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
 -  iGate function represent an Identity Matrix
 
 >>>iGate
 (2><2)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 1.0 :+ 0.0 ]
 -}
iGate::Gate
iGate=Gate ((2><2) [1,0,0,1]::Matrix C)

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


{-|
  -  gateProduct function is used to create gates that can be used on multiple qubits
 -}   
gateProduct::Gate -- ^ 'Gate' argument
           ->Gate -- ^ 'Gate' argument
           ->Gate -- ^ return value: 'Gate'
gateProduct g1 g2=Gate (kronecker (gateMatrix g1) (gateMatrix g2))


{-|
  -  Kronecker product operator is used to create gates that can be used on multiple qubits
 -} 
(<+>)::Gate -- ^ 'Gate' argument
     ->Gate -- ^ 'Gate' argument
     ->Gate -- ^ return value: 'Gate'
g1 <+> g2=gateProduct g1 g2







