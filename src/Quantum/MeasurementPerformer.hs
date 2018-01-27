{-|
 -Module      : MeasurementPerformer
 -Description : Definition of qubit measure function
 -Copyright   : (c) Mihai Sebastian Ardelean, 2018
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Quantum.MeasurementPerformer
    (
      MeasurementPerformer(..)
    ) 
    where

import Numeric.LinearAlgebra --hiding ( (|>) )
import Prelude --hiding ((<*>),(<+>))
import System.Random
import Data.List

import Quantum.Qubits
import Quantum.Gates
import Core.MeasureProcessInternal(startMeasurementProcess)

-- | Class MeasurementPerformer used to define measure operation that can be made with 'Quantum.Qubits.Qubit'
class MeasurementPerformer a where
  {-|
  - measure function is used to perform qubit measurement
  
  >>>measure circuit
  Qubit {qubitState = (4><1)
    [ 0.0 :+ 0.0
    , 1.0 :+ 0.0
    , 0.0 :+ 0.0
    , 0.0 :+ 0.0 ]}
 -} 
  measure::a->a

-- | MeasurementPerformer instance for 'Quantum.Qubits.Qubit'
instance MeasurementPerformer Qubit where
  measure=startMeasurementProcess






