module Starry () where

import Data.HashMap.Strict (HashMap)

data World = World {
  components :: [()]
  resources :: HashMap () ()
  systems :: [()]
}