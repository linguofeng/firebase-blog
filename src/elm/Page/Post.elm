module Page.Post exposing (..)

{-| 博文页
-}

import Html exposing (..)
import Model.Post exposing (Post)


posts : List Post
posts =
    [ { id = "86299582-4EA0-4C9E-9F22-6552635C4E99", title = "测试文章A", content = "测试文章A内容" }
    , { id = "B49D01D5-18AB-4722-A3CB-2E88E05A4230", title = "测试文章B", content = "测试文章B内容" }
    , { id = "D3B35624-D40F-4DD6-BB20-695DB012F449", title = "测试文章C", content = "测试文章C内容" }
    ]


view : String -> Html msg
view postId =
    let
        maybePost =
            List.head <| List.filter (\{ id } -> id == postId) posts
    in
        case maybePost of
            Just post ->
                div []
                    [ title post.title
                    , content post.content
                    ]

            Nothing ->
                div [] [ text "文章不存在" ]


title : String -> Html msg
title title =
    div [] [ h1 [] [ text title ] ]


content : String -> Html msg
content content =
    div [] [ text content ]
