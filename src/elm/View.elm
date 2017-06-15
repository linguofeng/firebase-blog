module View exposing (..)

import Html exposing (..)
import Model exposing (..)
import Msg exposing (..)


view : Model -> Html Msg
view model =
    div [] [ text "Hello" ]
