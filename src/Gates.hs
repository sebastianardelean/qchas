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

xGate::Matrix C
xGate=(2><2)[0,1,1,0]::Matrix C
    

yGate::Matrix C
yGate=(2><2) [0.0,0.0:+(-1.0),0.0:+1.0,0.0]::Matrix C

zGate::Matrix C
zGate=(2><2) [1,0,0,-1]::Matrix C

hGate::Matrix C
hGate=(2><2) [1/sqrt 2,1/sqrt 2,1/sqrt 2,(-1)/sqrt 2]::Matrix C

    

--rGate::Double->Matrix(Complex Double)
--rGate t=complexMatrix [[cos t,-sin t],[sin t, cos t]]   

cPhaseShifGate::Matrix C
cPhaseShifGate=(4><4)[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,-1]::Matrix C

cNotGate::Matrix C
cNotGate=(4><4)[1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0]::Matrix C