module Utils exposing ((=>), getPropertyKey, getPropertyValue)

import Html exposing (Attribute)
import Native.Utils


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


getPropertyKey : Attribute msg -> String
getPropertyKey =
    Native.Utils.getPropertyKey


getPropertyValue : Attribute msg -> String
getPropertyValue =
    Native.Utils.getPropertyValue
