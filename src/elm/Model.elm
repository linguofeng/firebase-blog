module Model exposing (..)

import Routes exposing (Route)


type alias Model =
    { route : Route }


init : Route -> Model
init route =
    { route = route }
