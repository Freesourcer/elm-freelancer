module Freelancer.Util.DebugExtras (logDefault) where

import Debug


-- Get the value inside a Maybe, returning a default value and logging a message if Nothing
logDefault : a -> String -> Maybe a -> a
logDefault defaultValue msg mx = case mx of
  Just x  -> x
  Nothing -> Debug.log msg defaultValue

