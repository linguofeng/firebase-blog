module Model exposing (..)


type Route
    = NotFoundRoute
    | IndexRoute


type alias Model =
    { route : Route }


initModel : Route -> Model
initModel route =
    { route = route }
