module Freelancer.Util.MaybeExtras (flatten, isJust, toList, zip, (~>), (|~>), (~>>)) where

import Maybe exposing (map)


-- Does this Maybe contain a value?
isJust : Maybe a -> Bool
isJust x = case x of
  Just _  -> True
  Nothing -> False

-- Convert a Maybe value to a list, empty for Nothing
toList : Maybe a -> List a
toList m = case m of 
  Just x  -> [x]
  Nothing -> []

-- Map a function over the contents of a Maybe
(~>) : Maybe a -> (a -> b) -> Maybe b
(~>) = 
  flip map

-- Map a function returning a Maybe over the contents of a Maybe
(|~>) : Maybe a -> (a -> Maybe b) -> Maybe b
(|~>) x f = 
  flatten (x ~> f)

-- Map a function over the contents of a Maybe
(~>>) : (a -> Maybe b) -> (b -> c) -> (a -> Maybe c)
(~>>) f g = 
  \x -> f x ~> g

-- Extract the inner Maybe from a `Maybe (Maybe a)`
flatten : Maybe (Maybe a) -> Maybe a
flatten x = case x of 
  Just (Just v) -> Just v
  _             -> Nothing

-- A tuple of Maybes as a Maybe tuple. If either side is Nothing, so is the output.
zip : (Maybe a, Maybe b) -> Maybe (a, b)
zip xy = case xy of
  (Just x, Just y) -> Just (x, y)
  _                -> Nothing

