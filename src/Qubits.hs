{-|
 -Module      : Qubits
 -Description : Definitions of |0>, |1>, |+> and |->
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Qubits
    ( 
          qOne
        , qZero
        , qPlus
        , qMinus
        , Qubit(..)
--        , qubitState
    ) where

import Numeric.LinearAlgebra

data Qubit=
    Qubit {
            qubitState::Matrix C -- ^ Qubit constructor accepts a parameter of type Matrix C
          } deriving (Eq,Show)



{-|
 -  qZero function is used to represent a 0 qubit |0>
 
 >>>qZero
 (2><1)
 [ 1.0 :+ 0.0
 , 0.0 :+ 0.0 ]
 -}
qZero::Qubit
qZero=Qubit ((2><1)[1,0]::Matrix C)

    


{-|
 -  qOne function is used to represent a 1 qubit |1>
 
 >>>qOne
 (2><1)
 [ 0.0 :+ 0.0
 , 1.0 :+ 0.0 ]
 -}
qOne::Qubit
qOne=Qubit ((2><1) [0,1]::Matrix C)

{-|
 -  qPlus function is used to represent a + qubit |+>
 - |+> can be also obtained by applying Hadamard Gate on |0>. See 'Utils.apply' for more information

 >>>qPlus
 (2><1)
 [ 0.7071067811865475 :+ 0.0
 , 0.7071067811865475 :+ 0.0 ]
 -}
qPlus::Qubit
qPlus=Qubit ((2><1) [1/sqrt 2, 1/sqrt 2]::Matrix C)

{-|
 -  qMinus function is used to represent a - qubit |->
 - Same as |+>, qubit |-> can be obtained by applying Hadamard Gate on |1>. See 'Utils.apply' for more information
 
 >>>qMinus
 (2><1)
 [       0.7071067811865475 :+ 0.0
 , (-0.7071067811865475) :+ (-0.0) ]
 -}
qMinus::Qubit 
qMinus=Qubit ((2><1) [1/sqrt 2, -1/sqrt 2]::Matrix C)