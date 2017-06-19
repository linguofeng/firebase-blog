module Page.Home exposing (..)

{-| 首页
-}

import Html exposing (..)
import Msg exposing (Msg)
import Routes exposing (to, Route(PostRoute))
import Model.Post exposing (Post)
import Custom.Html exposing (link)


posts : List Post
posts =
    [ { id = "86299582-4EA0-4C9E-9F22-6552635C4E99", title = "测试文章A", content = "" }
    , { id = "B49D01D5-18AB-4722-A3CB-2E88E05A4230", title = "测试文章B", content = "" }
    , { id = "D3B35624-D40F-4DD6-BB20-695DB012F449", title = "测试文章C", content = "" }
    ]


view : Html Msg
view =
    div [] [ ul [] <| List.map item posts ]


item : Post -> Html Msg
item post =
    li [] [ link [ to <| PostRoute post.id ] [ text post.title ] ]
