
import Maybe
import Task exposing (Task, andThen, fail, onError, succeed)
import Signal exposing (Mailbox)

import Http

import Html exposing (div)

import Freelancer.Users as Users
import Freelancer.Types exposing (..)
import Freelancer.Util.MaybeExtras exposing ((~>))

import Core.Types as Core exposing (..)

qGetCurrentUser : Mailbox (Maybe UserId)
qGetCurrentUser = Signal.mailbox Nothing

mbGetCurrentUser : Mailbox (Maybe User)
mbGetCurrentUser = Signal.mailbox Nothing

port runGetCurrentUser : Signal (Task Http.Error ())
port runGetCurrentUser = 
  Signal.map (onlyWith <| \_ -> Users.getCurrentUser mbGetCurrentUser.address) qGetCurrentUser.signal

onlyWith f x = Maybe.withDefault (succeed ()) (x ~> f)

main = Signal.map (\x -> div [] [toString x]) mbGetCurrentUser.signal

