{-|
 -Module      : Operations.QuantumOperations
 -Description : Quantum Operations
 -Copyright   : (c) Mihai Sebastian Ardelean, 2018
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Operations.QuantumOperations
  ( 
    QubitOperations(..)
  , GateOperations(..)
  ) where

import Numeric.LinearAlgebra hiding ( (|>) )    

import Quantum.Qubits
import Core.QOperationsInternal(entangleTwoQubits
  ,applyGate
  ,outerProduct
  ,multiply
  ,kron)
import Quantum.Gates



-- | Class QubitOperations used to define common operations that can be made with 'Quantum.Qubits.Qubit'
class QubitOperations a where
  {-|
  - entangle function is used to perform the Kronecker product between two qubits.
  
  >>>entangle qZero qOne
  (4><1)
    [ 0.0 :+ 0.0
    , 1.0 :+ 0.0
    , 0.0 :+ 0.0
    , 0.0 :+ 0.0 ]
  -} 
  entangle::a->a->a

  {-|
  -|> function is used to apply a gate on a qubit
  
  >>>qZero |> hGate 
  (2><1)
    [ 0.7071067811865475 :+ 0.0
    , 0.7071067811865475 :+ 0.0 ]
  -}  
  (|>)::a->Gate->a

  {-|
  -|><| function represents the outer product.
  
  >>>qZero |><| qZero 
  (2><2)
    [ 1.0 :+ 0.0, 0.0 :+ 0.0
    , 0.0 :+ 0.0, 0.0 :+ 0.0 ]
  -}  
  (|><|)::a->a->Gate

  {-|
  -mul function is used to multiply the states with a constant.

  >>>qZero * 5 
  (2><1)
    [ 5.0 :+ 0.0, 0.0 :+ 0.0
    , 0.0 :+ 0.0, 0.0 :+ 0.0 ]
  -} 
  (*)::a->Complex Double->a
  
-- | QubitOperations instance for 'Quantum.Qubits.Qubit'
instance QubitOperations Qubit where
  entangle = entangleTwoQubits 
  (|>)=flip applyGate
  (|><|)=outerProduct
  (*)=multiply

-- | Class GateOperations used to define common operations that can be made with 'Quantum.Gates.Gate'
class GateOperations a where
  
  {-|
  - Kronecker product operator is used to create gates that can be used on multiple qubits
  
  >>>hGate <*> hGate
  (4><4)
  [ 0.4999999999999999 :+ 0.0,    0.4999999999999999 :+ 0.0,    0.4999999999999999 :+ 0.0,    0.4999999999999999 :+ 0.0
  , 0.4999999999999999 :+ 0.0, (-0.4999999999999999) :+ 0.0,    0.4999999999999999 :+ 0.0, (-0.4999999999999999) :+ 0.0
  , 0.4999999999999999 :+ 0.0,    0.4999999999999999 :+ 0.0, (-0.4999999999999999) :+ 0.0, (-0.4999999999999999) :+ 0.0
  , 0.4999999999999999 :+ 0.0, (-0.4999999999999999) :+ 0.0, (-0.4999999999999999) :+ 0.0,    0.4999999999999999 :+ 0.0 ]}
  -} 
  (<*>)::a->a->a


-- | GateOperations instance for 'Quantum.Gates.Gate'
instance GateOperations Gate where
  (<*>)=kron


