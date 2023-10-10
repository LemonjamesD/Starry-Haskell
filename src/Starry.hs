module Starry (World) where

import Data.HashMap.Strict (HashMap)

data Dynamic c where 
  Dynamic :: c a => a -> Some c

data World = World {
  components :: [Dynamic Component]
, resources :: HashMap () ()
, systems :: [()]
}