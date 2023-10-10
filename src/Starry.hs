{-# LANGUAGE RecordWildCards #-}
module Starry (World, newWorld, addComponent, addResource, addSystem) where

import Data.Typeable (TypeRep, typeOf, Typeable)
import Data.HashMap.Strict (HashMap, empty, insert)
import Starry.Components (Component)
import Starry.Resources (Resource)

data Dynamic c where 
  Dynamic :: c a => a -> Dynamic c

type SystemType = (World -> IO World)

data World = World {
  components :: [Dynamic Component]
, takenIndices :: [Int]
, resources :: HashMap (TypeRep) (Dynamic Resource)
, systems :: [SystemType]
}

newWorld :: World
newWorld = World {
  components = []
, takenIndices = []
, resources = empty
, systems = []
}

addComponent :: Component a => a -> World -> World
addComponent comp world@(World { .. })= world {
  components = components ++ [Dynamic comp]
}

addResource :: (Resource a, Typeable a) => a -> World -> World
addResource res world@(World { .. }) = world {
  resources = insert (typeOf res) (Dynamic res) resources
}

addSystem :: SystemType -> World -> World
addSystem system world@(World { .. }) = world {
  systems = systems ++ [system]
}

-- getComponents :: Component a => World -> (World, [a])
-- getComponents world@(World { .. }) = 

-- updateComponents :: Component a => [a] -> World
-- updateComponents comps world@(World { .. }) = world 