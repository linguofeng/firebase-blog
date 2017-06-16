module Main exposing (main)

import Navigation exposing (Location)
import Model as M exposing (..)
import Msg exposing (..)
import View exposing (..)
import Update exposing (..)
import Routes exposing (..)


init : Location -> ( Model, Cmd Msg )
init location =
    ( M.init <| parseLocation location, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
