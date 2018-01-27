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

