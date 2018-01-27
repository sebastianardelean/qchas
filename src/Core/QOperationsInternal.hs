module Core.QOperationsInternal
  (
      entangleTwoQubits
    , applyGate
    , outerProduct
    , multiply
    , kron
    , addGate
    , subGate
  )where

import Numeric.LinearAlgebra hiding ( (|>) )
import Quantum.Qubits
import Quantum.Gates

entangleTwoQubits::Qubit->Qubit->Qubit
entangleTwoQubits q1 q2=Qubit (kronecker (qubitState q1) (qubitState q2))

applyGate::Gate->Qubit->Qubit
applyGate m v=Qubit (gateMatrix m <> qubitState v)

outerProduct::Qubit->Qubit->Gate
outerProduct q1 q2=product
  where
    q1Flatten=flatten $ qubitState q1
    q2Flatten=flatten $ qubitState q2
    product=Gate (q1Flatten `outer` q2Flatten)

multiply::Qubit->Complex Double->Qubit
multiply q c=multiplyWithConstant
  where
    qFlatten=flatten $ qubitState q
    result=scale c qFlatten
    qubitStatesLength=size result
    multiplyWithConstant=Qubit(reshape 1 result)


kron::Gate->Gate->Gate
kron g1 g2=Gate (kronecker (gateMatrix g1) (gateMatrix g2))



addGate::Gate->Gate->Gate
addGate g1 g2=Gate (gateMatrix g1 + gateMatrix g2)


 
subGate::Gate->Gate->Gate 
subGate g1 g2=Gate (gateMatrix g1 - gateMatrix g2)
