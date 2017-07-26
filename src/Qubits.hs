module Qubits
    ( 
         qOne
        ,qZero
        ,qPlus
        ,qMinus
    ) where

import Numeric.LinearAlgebra




qZero::Matrix C
qZero=(2><1)[1,0]::Matrix C

qOne::Matrix C
qOne=(2><1) [0,1]::Matrix C

qPlus::Matrix C
qPlus=(2><1) [1/sqrt 2, 1/sqrt 2]::Matrix C

qMinus::Matrix C
qMinus=(2><1) [1/sqrt 2, -1/sqrt 2]::Matrix C