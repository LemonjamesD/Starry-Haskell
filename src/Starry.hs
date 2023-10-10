module Starry (World) where

import Data.HashMap.Strict (HashMap)
import Starry.Components (Component)

data Dynamic c where 
  Dynamic :: c a => a -> Dynamic c

data World = World {
  components :: [Dynamic Component]
, resources :: HashMap () ()
, systems :: [()]
}