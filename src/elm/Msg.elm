module Msg exposing (..)

import Navigation


type alias Url =
    String


type Msg
    = ChangeLocation Url
    | OnLocationChange Navigation.Location
