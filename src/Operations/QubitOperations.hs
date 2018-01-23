{-|
 -Module      : Gates
 -Description : Basic Quantum Gates
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Operations.QubitOperations
  ( 
    entangle
  , apply
  , (|>)
  , (|><|)
  , mul
  
  ) where
import Numeric.LinearAlgebra hiding ( (|>) )
import Quantum.Qubits
import Quantum.Gates
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
  -|> function have the same effect like `apply`.
  
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
  -|><| function represents the outer product.
  
  >>>qZero |><| qZero 
 (2><2)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0 ]
 -}  
(|><|)::Qubit -- ^ 'Qubit' argument 
      ->Qubit -- ^ 'Qubit' argument 
      ->Gate  -- ^ return value: 'Gate'
q1 |><| q2=outerProduct
    where 
        q1Flatten=flatten $ qubitState q1
        q2Flatten=flatten $ qubitState q2
        outerProduct=Gate (q1Flatten `outer` q2Flatten)

{-|
  -mul function is used to multiply the states with a constant.

 >>>qZero `mul` 5 
 (2><2)
 [ 1.0 :+ 0.0, 0.0 :+ 0.0
 , 0.0 :+ 0.0, 0.0 :+ 0.0 ]
 -} 
mul::Qubit -- ^ 'Qubit' argument
   ->Complex Double -- ^ Constant value
   ->Qubit -- ^ return value: 'Qubit'
mul q c=multiplyWithConstant
  where
    qFlatten=flatten $ qubitState q
    result=scale c qFlatten
    qubitStatesLength=size result
    multiplyWithConstant=Qubit(reshape 1 result)

