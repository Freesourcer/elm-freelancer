module Freelancer.Common where

import Debug exposing (log)
import Json.Decode exposing ((:=))
import Task exposing (Task, andThen, fail, onError)


sendTo : Signal.Address (Maybe a) -> Task err a -> Task err ()
sendTo addr x = 
  x `andThen` (Just >> Signal.send addr) `onError` \e -> log (toString e) (fail e)

