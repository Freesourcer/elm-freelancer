module Freelancer.Endpoints where

import Json.Decode as JD exposing (Decoder, (:=))
import Task exposing (Task, andThen, fail, onError, succeed)
import Time

import Http
import GetWithHeaders exposing (Headers)

import Freelancer.Decode as Decode
import Freelancer.Types exposing (..)

apiVersion = "0.1"

-- Prod
baseUrl   = "https://www.freelancer.com/api/"
devKey    = "FLN5EDGYBTQNKZKXF6ETDYFUDCZSD53G"
devUserId = 4

-- Dev
--baseUrl    = "https://hackathon.syd1.fln-dev.net/api/"
--devKey     = "FLNVXIIBU4JOOJKNT61JXIOAVQ59JIPK"
--devUserId  = 16

userApi    = api "users" 
projectApi = api "projects"

-- Users
getCurrentUser                  = get' Decode.user    <| userApi "self"
getUserById (UserId id)         = get  Decode.user    <| userApi (toString id)
-- Projects
--createNewProject (NewProject x) = get  Decode.project <| projectApi (toString id)
getProjectById (ProjectId id)   = get  Decode.project <| projectApi (toString id)

-- Utility functions

-- Get the URL for a specific section of the API
api : String -> String -> String
api section action = 
  baseUrl ++ section ++ "/" ++ apiVersion ++ "/" ++ section ++ "/" ++ action ++ "/"

decodeResponse : Decoder a -> Decoder a
decodeResponse d = "result" := d

-- Get data from a JSON endpoint without dev headers
get : Decoder a -> String -> Task Http.Error a
get decoder url =
  getWithHeaders decoder [] url

-- Get data from a JSON endpoint using the development headers
get' : Decoder a -> String -> Task Http.Error a
get' decoder url =
  let
    headers = [("Freelancer-Developer-Auth-V1", (toString devUserId) ++ ";" ++ devKey)]
  in
    request decoder <| Http.Request "GET" headers url Http.empty

apiSettings = 
  { timeout             = Time.second * 60
  , onStart             = Nothing
  , onProgress          = Nothing
  , desiredResponseType = Just "application/json"
  }

request : Decoder a -> Http.Request -> Task Http.Error a
request decoder req = 
  Http.send apiSettings req
  `onError` (\e -> case e of 
    Http.RawTimeout      -> fail Http.Timeout
    Http.RawNetworkError -> fail Http.NetworkError)
  `andThen` (\rsp -> case (rsp.status, rsp.value) of 
    (200, Http.Text v) -> succeed v
    _                  -> fail <| Http.BadResponse rsp.status rsp.statusText)
  `andThen` \val -> case (JD.decodeString decoder val) of
    Ok v  -> succeed v
    Err e -> fail <| Http.BadResponse 200 e
    
getWithHeaders : Decoder a -> Headers -> String -> Task Http.Error a
getWithHeaders decoder headers url =
    GetWithHeaders.get (decodeResponse decoder) headers url
    `andThen` \(_, x) -> succeed x

