module Freelancer.Projects where

import Json.Decode exposing ((:=))
import Task exposing (Task)

import Http

import Freelancer.Common exposing (sendTo)
import Freelancer.Decode as Decode
import Freelancer.Endpoints as Endpoints
import Freelancer.Types exposing (..)


getProjectById : Signal.Address (Maybe Project) -> ProjectId -> Task Http.Error ()
getProjectById addr id =
  Endpoints.getProjectById id |> sendTo addr


