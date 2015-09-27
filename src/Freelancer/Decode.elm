module Freelancer.Decode where

import Debug exposing (log)
import Dict exposing (Dict)
import Json.Decode exposing (..)
import Set exposing (Set)

import Freelancer.Types exposing (..)
import Freelancer.Util.MaybeExtras exposing ((~>),(|~>))


decodeUser : String -> Result String User
decodeUser =
  decodeString user

user : Decoder User
user =
  valueDict `andThen` \x -> succeed 
    { id                  = getOrElse int "id" 0 x |> UserId
    , accountBalances     = 0
    , avatar              = get string "avatar" x
    , avatarCdn           = get' string "avatarCdn" x
    , avatarLarge         = get' string "avatarLarge" x
    , badges              = []
    , chosenRole          = 0
    , closed              = get bool "closed" x
    , coverImage          = 0
    , displayName         = get' string "displayName" x
    , email               = get string "email" x
    , employerReputation  = 0
    , forceVerify         = get' bool "forceVerify" x
    , hourlyRate          = 0
    , isActive            = get' bool "isActive" x
    , jobs                = []
    , limitedAccount      = get' bool "limitedAccount" x
    , location            = 0
    , membershipPackage   = 0
    , portfolioCount      = 0
    , preferredFreelancer = get' bool "preferredFreelancer" x
    , primaryCurrency     = 0
    , primaryLanguage     = get' string "primaryLanguage" x
    , profileDescription  = ""
    , qualifications      = []
    , registrationDate    = 0
    , reputation          = 0
    , role                = 0
    , searchLanguages     = Set.empty
    , spamProfile         = 0
    , status              = 0
    , suspended           = get bool "suspended" x
    , tagline             = get string "tagline" x
    , trueLocation        = 0
    , username            = getOrElse string "username" "" x
    }

project : Decoder Project
project =
  valueDict `andThen` \x -> succeed   
    { id                     = getOrElse int "id" 0 x |> ProjectId
    , activePrepaidMilestone = 0
    , assisted               = get bool "assisted" x
    , attachments            = []
    , bidperiod              = getOrElse int "bidperiod" 0 x
    , bidStats               = 0
    , budget                 = 0
    , canPostReview          = 0
    , currency               = 0
    , deleted                = getOrElse bool "deleted" False x
    , description            = get string "description" x
    , featured               = getOrElse bool "featured" False x
    , frontendProjectStatus  = 0
    , hidebids               = getOrElse bool "hidebids" False x
    , hireme                 = getOrElse bool "hireme" False x
    , hiremeInitialBid       = 0
    , hourlyProjectInfo      = 0
    , invitedFreelancers     = []
    , jobs                   = []
    , language               = getOrElse string "language" "" x
    , local                  = getOrElse bool "local" False x
    , location               = 0
    , ndaSignatures          = Set.empty
    , negotiated             = getOrElse bool "negotiated" False x
    , negotiatedBid          = 0
    , nonpublic              = getOrElse bool "nonpublic" False x
    , ownerId                = get' int "ownerId" x ~> UserId
    , previewDescription     = get' string "previewDescription" x
    , qualifications         = []
    , recommendedFreelancers = []
    , seoUrl                 = get' string "seoUrl" x
    , status                 = 0
    , submitdate             = 0
    , subStatus              = 0
    , timeFreeBidsExpire     = 0
    , timeSubmitted          = 0
    , timeUpdated            = 0
    , title                  = getOrElse string "title" "" x
    , trueLocation           = 0
    , type'                  = 0
    , upgrades               = 0
    , urgent                 = getOrElse bool "urgent" False x
    }

valueDict : Decoder (Dict String Value)
valueDict =
  dict value

getOrElse : Decoder a -> String -> a -> Dict String Value -> a
getOrElse decoder k defaultVal dct =
  case (Dict.get k dct) of
    Nothing      -> log ("No such key: " ++ k) defaultVal
    Just jsonVal ->
      case (decodeValue decoder jsonVal) of
        Ok v  -> v
        Err e -> log ("Error decoding value for '" ++ k ++ "': " ++ e) defaultVal

-- get a nullable value from an object, logging an error if the key does not exist
get : Decoder a -> String -> Dict String Value -> Maybe a
get decoder k dct =
  case (Dict.get k dct) of
    Nothing      -> log ("No such key for nullable field: " ++ k) Nothing
    Just jsonVal ->
      case decodeValue (oneOf [map Just decoder, null Nothing]) jsonVal of
        Ok v  -> v
        Err e -> log ("Error decoding value for '" ++ k ++ "': " ++ e) Nothing

-- get a nullable value from an object, ignoring keys that do not exist
get' : Decoder a -> String -> Dict String Value -> Maybe a
get' decoder k dct =
  (Dict.get k dct) |~> \jsonVal ->
    case decodeValue (oneOf [map Just decoder, null Nothing]) jsonVal of
      Ok v  -> v
      Err e -> log (("Error decoding value for " ++ k) ++ ": " ++ e) Nothing

getStringOrElse = getOrElse string
getIntOrElse    = getOrElse int
getBoolOrElse   = getOrElse bool

