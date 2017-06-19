module Routes exposing (Route(..), parseLocation, to)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Json.Encode as Json
import Navigation exposing (Location)
import UrlParser as Url exposing (parsePath, (</>), s, oneOf, top, string, int, Parser)


type alias PostId =
    String


type Route
    = NotFoundRoute
    | HomeRoute
    | PostRoute PostId


match : Parser (Route -> a) a
match =
    oneOf
        [ Url.map HomeRoute top
        , Url.map PostRoute (s "posts" </> string)
        ]


parseLocation : Location -> Route
parseLocation location =
    location
        |> parsePath match
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
        "/" ++ (String.join "/" paths)


{-| 自定义一个接收路由的`to`属性

    list [ to HomeRoute ] [ text "首页" ]

-}
to : Route -> Attribute msg
to route =
    route
        |> routeToString
        |> Json.string
        |> Attr.property "to"
