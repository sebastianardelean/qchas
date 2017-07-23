module Qubits
    ( 
         qOne
        ,qZero
        ,qPlus
        ,qMinus
    ) where


import Data.Complex
import Data.List(transpose)
import Utils

qZero::Vector(Complex Double)
qZero=complexVector[1,0]

qOne::Vector(Complex Double)
qOne=complexVector[0,1]

qPlus::Vector(Complex Double)
qPlus=complexVector[1/sqrt 2, 1/sqrt 2]

qMinus::Vector(Complex Double)
qMinus=complexVector[1/sqrt 2, -1/sqrt 2]