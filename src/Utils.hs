module Utils
    ( 
        Vector
      , Matrix
      , complexVector
      , complexMatrix
    ) where

import Data.Complex
import Data.List(transpose)

-- Basic new types needed for defining qubits
type Vector a=[a]
type Matrix a=[Vector a]

complexVector::Real a=>Vector a->Vector(Complex Double)
complexVector=map(\i->realToFrac i:+0.0)

complexMatrix::Real a=>Matrix a->Matrix(Complex Double)
complexMatrix=map complexVector





