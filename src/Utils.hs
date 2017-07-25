module Utils
    ( 
        Vector
      , Matrix
      , complexVector
      , complexMatrix
      , (<*>)
      , (<+>)
      , entangle
      , (|>)
    ) where

import Data.Complex
import Data.List(transpose)
import Prelude hiding ((<*>),(<+>))


-- Basic new types needed for defining qubits
type Vector a=[a]
type Matrix a=[Vector a]

complexVector::Real a=>Vector a->Vector(Complex Double)
complexVector=map(\i->realToFrac i:+0.0)

complexMatrix::Real a=>Matrix a->Matrix(Complex Double)
complexMatrix=map complexVector


(<*>)::Num a=>a->Matrix a->Matrix a
c <*> m= map (map (c *)) m

--tensor product
(<+>)::Num a=>Matrix a->Matrix a->Matrix a
m1 <+> m2=concatMap collateRows $ groups n [c<*>m2|c<-concat m1]
   where
   n=length $ head m1
   groups::Int->[a]->[[a]]
   groups i s 
          | null s=[]
          | otherwise=let (h,t)=splitAt i s in h:groups i t
   collateRows::[Matrix a]->Matrix a
   collateRows=map concat . transpose

entangle::Num a=>Vector a->Vector a->Vector a
entangle q1 q2=[qs1*qs2 | qs1<-q1,qs2<-q2]

apply::Num a=>Matrix a->Vector a->Vector a
apply m v=map(sum . zipWith(*) v) m

(|>)::Num a=>Vector a->Matrix a->Vector a
(|>)=flip apply
