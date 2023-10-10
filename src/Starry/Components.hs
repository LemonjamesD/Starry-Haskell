module Starry.Components (Component, ComponentInstance) where

data Component = forall a . ComponentInstance a => Component a

class ComponentInstance a where
