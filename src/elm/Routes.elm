module Routes exposing (Route(..), href, parseLocation)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)
import UrlParser as Url exposing (parseHash, (</>), s, oneOf, top, string, int, Parser)


type alias PostId =
    String


type Route
    = NotFoundRoute
    | HomeRoute
    | PostRoute PostId


matcher : Parser (Route -> a) a
matcher =
    oneOf
        [ Url.map HomeRoute (s "")
        , Url.map PostRoute (s "posts" </> string)
        ]


parseLocation : Location -> Route
parseLocation location =
    if String.isEmpty location.hash then
        HomeRoute
    else
        location
            |> parseHash matcher
            |> Maybe.withDefault NotFoundRoute


routeToString : Route -> String
routeToString route =
    let
        paths =
            case route of
                HomeRoute ->
                    []

                PostRoute postId ->
                    [ "posts", postId ]

                _ ->
                    []
    in
        "#/" ++ (String.join "/" paths)


href : Route -> Attribute msg
href route =
    Attr.href <| routeToString route
