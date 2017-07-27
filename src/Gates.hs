{-|
 -Module      : Gates
 -Description : Basic Quantum Gates
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 --}

module Gates
    (
        xGate
      , yGate
      , zGate
      , hGate
      --, rGate
      , cPhaseShifGate
      , cNotGate
    )where


import Numeric.LinearAlgebra
import Qubits
import Prelude hiding ((<*>),(<+>))

{-|
 -  xGate function represent a Pauly X-Gate
 
 >>>xGate
 (2><2)
 [ 0.0 :+ 0.0, 1.0 :+ 0.0
 , 1.0 :+ 0.0, 0.0 :+ 0.0 ]
 -}
xGate::Matrix C
xGate=(2><2)[0,1,1,0]::Matrix C
    
{-|
 -  yGate function represent a Pauly Y-Gate
 
 >>>yGate
(2><2)
 [ 0.0 :+ 0.0, 0.0 :+ (-1.0)
 , 0.0 :+ 1.0,    0.0 :+ 0.0 ]
 -}
yGate::Matrix C
yGate=(2><2) [0.0,0.0:+(-1.0),0.0:+1.0,0.0]::Matrix C

{-|
 -  zGate function represent a Pauly Z-Gate
 
 >>>zGate
 (2><2)
 [ 1.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, (-1.0) :+ (-0.0) ]
 -}
zGate::Matrix C
zGate=(2><2) [1,0,0,-1]::Matrix C

{-|
 -  hGate function represent a Hadamard Gate
  
  >>>hGate
 (2><2)
 [ 0.7071067811865475 :+ 0.0,    0.7071067811865475 :+ 0.0
 , 0.7071067811865475 :+ 0.0, (-0.7071067811865475) :+ 0.0 ]
 -}
hGate::Matrix C
hGate=(2><2) [1/sqrt 2,1/sqrt 2,1/sqrt 2,(-1)/sqrt 2]::Matrix C

    

--rGate::Double->Matrix(Complex Double)
--rGate t=complexMatrix [[cos t,-sin t],[sin t, cos t]]   

{-|
 -  cPhaseShifGate function represent a Controlled Phase-Shift Gate
 
 >>>cPhaseShifGate
(4><4)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0,       0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, (-1.0) :+ (-0.0) ]
 -}
cPhaseShifGate::Matrix C
cPhaseShifGate=(4><4)[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,-1]::Matrix C

{-|
 -  cNotGate function represent a Controlled-Not Gate
 
 >>cNotGate
 (4><4)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0, 1.0 :+ 0.0, 0.0 :+ 0.0 ]
 -}
cNotGate::Matrix C
cNotGate=(4><4)[1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0]::Matrix C