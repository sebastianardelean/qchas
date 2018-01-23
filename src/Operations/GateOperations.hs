{-|
 -Module      : Gates
 -Description : Basic Quantum Gates
 -Copyright   : (c) Mihai Sebastian Ardelean, 2017
 -License     : BSD3
 -Maintainer  : ardeleanasm@gmail.com
 -Portability : POSIX
 -}
module Operations.GateOperations
  (
    (<+>)
   , addGate
   , subGate
  )where
import Numeric.LinearAlgebra --hiding ( (|>) )
import Quantum.Gates

{-|
  -  gateProduct function is used to create gates that can be used on multiple qubits
 -}   
gateProduct::Gate -- ^ 'Gate' argument
           ->Gate -- ^ 'Gate' argument
           ->Gate -- ^ return value: 'Gate'
gateProduct g1 g2=Gate (kronecker (gateMatrix g1) (gateMatrix g2))


{-|
  -  Kronecker product operator is used to create gates that can be used on multiple qubits
 -} 
(<+>)::Gate -- ^ 'Gate' argument
     ->Gate -- ^ 'Gate' argument
     ->Gate -- ^ return value: 'Gate'
g1 <+> g2=gateProduct g1 g2


{-|
  -  Gate addition, a wrapper function over matrix addition
 -} 
addGate::Gate -- ^ 'Gate' argument
       ->Gate -- ^ 'Gate' argument
       ->Gate -- ^ return value: 'Gate'
addGate g1 g2=Gate (gateMatrix g1 + gateMatrix g2)


{-|
  -  Gate subtraction, a wrapper function over matrix subtraction
 -} 
subGate::Gate -- ^ 'Gate' argument
       ->Gate -- ^ 'Gate' argument
       ->Gate -- ^ return value: 'Gate'
subGate g1 g2=Gate (gateMatrix g1 - gateMatrix g2)

