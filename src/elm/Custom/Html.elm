module Custom.Html exposing (link)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onWithOptions, Options)
import Json.Decode
import Msg exposing (..)
import Utils


{-| 重写a标签，实现路由跳转的功能

    link [ to Routes.Login ] [ text "登录" ]

-}
link : List (Attribute Msg) -> List (Html Msg) -> Html Msg
link attributes content =
    let
        attrs =
            case getToAttrValue attributes of
                Just value ->
                    List.append attributes
                        [ href value
                        , onClick (ChangeLocation value)
                        ]

                Nothing ->
                    attributes
    in
        a attrs content


{-| 获取`to`属性的值
-}
getToAttrValue : List (Attribute Msg) -> Maybe String
getToAttrValue attributes =
    List.filter eqTo attributes
        |> List.head
        |> Maybe.map (\attr -> Utils.getPropertyValue attr)


{-| key等于`to`的属性
-}
eqTo : Attribute Msg -> Bool
eqTo attr =
    Utils.getPropertyKey attr == "to"


onClick : Msg -> Attribute Msg
onClick msg =
    onWithOptions
        "click"
        (Options True True)
        (Json.Decode.succeed msg)
