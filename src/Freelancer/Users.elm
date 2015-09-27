module Freelancer.Users where

import Debug exposing (log)
import Json.Decode exposing ((:=))
import Task exposing (Task, andThen, fail, onError)

import Http
import GetWithHeaders

import Freelancer.Common exposing (sendTo)
import Freelancer.Decode as Decode
import Freelancer.Endpoints as Endpoints
import Freelancer.Types exposing (..)


getUserById : Signal.Address (Maybe User) -> UserId -> Task Http.Error ()
getUserById addr id =
  Endpoints.getUserById id |> sendTo addr

getCurrentUser : Signal.Address (Maybe User) -> Task Http.Error ()
getCurrentUser addr =
  Endpoints.getCurrentUser |> sendTo addr


