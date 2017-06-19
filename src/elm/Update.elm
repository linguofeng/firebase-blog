module Update exposing (..)

import Navigation
import Msg exposing (..)
import Model exposing (..)
import Routes exposing (parseLocation)
import Utils exposing ((=>))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLocation url ->
            model => Navigation.newUrl url

        OnLocationChange location ->
            { model | route = parseLocation location } => Cmd.none
