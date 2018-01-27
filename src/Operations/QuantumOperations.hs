{-|
 -Module      : Gates
 -Description : Basic Quantum Gates
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
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
  ,kron
  ,addGate
  ,subGate)
import Quantum.Gates




class QubitOperations a where
  entangle::a->a->a
  (|>)::a->Gate->a
  (|><|)::a->a->Gate
  (*)::a->Complex Double->a
  

instance QubitOperations Qubit where
  entangle = entangleTwoQubits 
  (|>)=flip applyGate
  (|><|)=outerProduct
  (*)=multiply


class GateOperations a where
  (<*>)::a->a->a
  (<+>)::a->a->a
  (<->)::a->a->a
instance GateOperations Gate where
  (<*>)=kron
  (<+>)=addGate
  (<->)=subGate
