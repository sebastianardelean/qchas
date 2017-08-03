{-|
 -Module      : Utils
 -Description : Definitions of basic mathematical operations on qubits and gates
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Utils
    ( 
        entangle
      , apply
      , (|>)
      , gateProduct
    ) where

import Numeric.LinearAlgebra hiding ( (|>) )
import Prelude hiding ((<*>),(<+>))

import Qubits
import Gates

{-|
  -  entangle function is used to perform the Kronecker product between two qubits.
  
  >>>entangle qZero qOne
(4><1)
 [ 0.0 :+ 0.0
 , 1.0 :+ 0.0
 , 0.0 :+ 0.0
 , 0.0 :+ 0.0 ]

 -}   
entangle::Qubit   -- ^ first 'Qubit' argument
        ->Qubit   -- ^ second 'Qubit' argument
        ->Qubit   -- ^ return value: 'Qubit'
entangle q1 q2=Qubit (kronecker (qubitState q1) (qubitState q2))

{-|
  -  apply function is used to apply a gate on a qubit
  
  >>>apply hGate qZero
 (2><1)
 [ 0.7071067811865475 :+ 0.0
 , 0.7071067811865475 :+ 0.0 ]
 -}   
apply::Gate   -- ^ 'Gate' argument
     ->Qubit  -- ^ 'Qubit' argument 
     ->Qubit  -- ^ return value: 'Qubit'
apply m v=Qubit (gateMatrix m <> qubitState v)

  


{-|
  -  |> function have the same effect like `apply`.
  
  >>>qZero |> hGate 
 (2><1)
 [ 0.7071067811865475 :+ 0.0
 , 0.7071067811865475 :+ 0.0 ]
 -}   
(|>)::Qubit  -- ^ 'Qubit' argument 
    ->Gate   -- ^ 'Gate' argument
    ->Qubit  -- ^ return value: 'Qubit'
(|>)=flip apply

{-|
  -  gateKronecker function is used to create gates that can be used on multiple qubits
 -}   
gateProduct::Gate -- ^ 'Gate' argument
           ->Gate -- ^ 'Gate' argument
           ->Gate -- ^ return value: 'Gate'
gateProduct g1 g2=Gate (kronecker (gateMatrix g1) (gateMatrix g2))