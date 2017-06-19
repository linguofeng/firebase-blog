module View exposing (..)

import Html exposing (..)
import Msg exposing (..)
import Model exposing (..)
import Routes exposing (Route(..))
import Page.Home as HomePage
import Page.Post as PostPage
import Page.NotFound as NotFoundPage


view : Model -> Html Msg
view model =
    case model.route of
        NotFoundRoute ->
            NotFoundPage.view

        HomeRoute ->
            HomePage.view

        PostRoute postId ->
            PostPage.view postId
