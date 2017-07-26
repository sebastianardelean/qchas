module Utils
    ( 
        entangle
      , (|>)
    ) where

import Numeric.LinearAlgebra hiding ( (|>) )
import Prelude hiding ((<*>),(<+>))




entangle::Matrix C->Matrix C->Matrix C
entangle q1 q2=kronecker q1 q2

    

apply::Matrix C->Matrix C->Matrix C
apply m v=m <> v

(|>)::Matrix C->Matrix C->Matrix C
(|>)=flip apply
