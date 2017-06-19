module Msg exposing (Msg(..))

import Navigation


type alias Url =
    String


type Msg
    = ChangeLocation Url
    | OnLocationChange Navigation.Location
