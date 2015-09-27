module Freelancer.Util.ListExtras (collect, collectWhenNot, zip) where

import List exposing (filter, map, map2)

import Freelancer.Util.MaybeExtras exposing (isJust)

collect : List (Maybe a) -> List a
collect xs = case xs of
  []            -> []
  Nothing::xs'  -> collect xs'
  (Just x)::xs' -> x::(collect xs')

collectWhenNot : (a -> Maybe b) -> List a -> List a
collectWhenNot f xs = filter (\x -> f x |> isJust |> not) xs

-- Combine a pair of lists into a list of pairs
zip : List a -> List b -> List (a, b)
zip xs ys = map2 (,) xs ys

