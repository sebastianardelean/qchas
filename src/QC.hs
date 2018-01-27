{-|
 -Module      : QC
 -Description : Quantum Computing
 -Copyright   : (c) Mihai Sebastian Ardelean, 2018
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 
 This module is used to import needed modules for Quantum Computing.
 
 -}
module QC(
   module Quantum.Qubits
  ,module Quantum.Gates
  ,module Quantum.MeasurementPerformer
  ,module Operations.QuantumOperations
   -- Dependencies
  ,module Numeric.LinearAlgebra
  ) where

import Numeric.LinearAlgebra hiding ( (|>) )    
import Prelude hiding ( (|>),(*),(<*>),(<+>),(<->) ) 
import Quantum.Qubits
import Quantum.Gates
import Quantum.MeasurementPerformer
import Operations.QuantumOperations

