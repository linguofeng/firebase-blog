module Update exposing (..)

import Msg exposing (..)
import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLocation url ->
            ( model, Cmd.none )

        OnLocationChange location ->
            ( model, Cmd.none )
