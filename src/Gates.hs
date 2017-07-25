module Gates
    (
        xGate
      , yGate
      , zGate
      , hGate
      , rGate
      , cPhaseShifGate
      , cNotGate
    )where

import Data.Complex
import Data.List(transpose)
import Utils
import Qubits
import Prelude hiding ((<*>),(<+>))

xGate::Matrix(Complex Double)
xGate=complexMatrix[[0,1],[1,0]]

yGate::Matrix(Complex Double)
yGate=[[0.0,0.0:+(-1.0)],[0.0:+1.0,0.0]] 

zGate::Matrix(Complex Double)
zGate=complexMatrix[[1,0],[0,-1]]

hGate::Matrix(Complex Double)
hGate=((1/sqrt 2):+0.0) <*> complexMatrix[[1,1],[1,-1]]

rGate::Double->Matrix(Complex Double)
rGate t=complexMatrix [[cos t,-sin t],[sin t, cos t]]   

cPhaseShifGate::Matrix(Complex Double)
cPhaseShifGate=complexMatrix[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,-1]]

cNotGate::Matrix(Complex Double)
cNotGate=complexMatrix[[1,0,0,0],[0,1,0,0],[0,0,0,1],[0,0,1,0]]