module Model.Post exposing (..)


type alias PostId =
    String


type alias Post =
    { id : PostId
    , title : String
    , content : String
    }
