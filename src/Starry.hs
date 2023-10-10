module Starry (World) where

import Data.Typeable (TypeRep)
import Data.HashMap.Strict (HashMap)
import Starry.Components (Component)
import Starry.Resources (Resource)

data Dynamic c where 
  Dynamic :: c a => a -> Dynamic c

data World = World {
  components :: [Dynamic Component]
, resources :: HashMap (TypeRep) (Dynamic Resource)
, systems :: [(World -> World)]
}