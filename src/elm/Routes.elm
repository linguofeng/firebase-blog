module Routes exposing (..)

import UrlParser as Url exposing (parsePath, (</>), s, oneOf, top, string, int, Parser)
import Navigation exposing (Location)
import Model exposing (..)
import Msg exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ Url.map IndexRoute top
        ]


parseLocation : Location -> Route
parseLocation location =
    Maybe.withDefault NotFoundRoute (parsePath matchers location)
