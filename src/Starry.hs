module Starry (World) where

import Data.HashMap.Strict (HashMap)

data World = World {
  components :: [()]
, resources :: HashMap () ()
, systems :: [()]
}