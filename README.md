# elm-freelancer
Elm bindings for the Freelancer API

This library provides Elm bindings for the Freelancer API. It was created for the Freelancer.com.au Hackathon, held in Sydney on the 26th and 27th of September 2015. 

### Installation:

```elm-package install Freesourcer/elm-freelancer```

### Usage:

elm-freelancer provides a thin wrapper over the excellent Freelancer.com.au [API](https://www.freelancer.com/api/docs/)

```elm
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
```

### Authors:

- Luke Williams (shmookey)
- Emma Faina Hayes (freesourcer)

### Licensing:

Free for use in commercial and non-commercial projects, see LICENSE for details.
