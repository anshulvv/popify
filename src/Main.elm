module Main exposing (..)

import Browser
import Element exposing (Attribute, Element)
import Element.Background
import Html
import Html.Events
import Popify


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type Msg
    = PopifyMsg Popify.Msg


type alias Model =
    { popifyModel : Popify.Model
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { popifyModel = { hidden = False }
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PopifyMsg msg_ ->
            Popify.update msg_ model.popifyModel
                |> (\( m, c ) -> ( { model | popifyModel = m }, c ))


view : Model -> Browser.Document Msg
view model =
    { title = "Popify Demo"
    , body =
        [ Element.layout
            []
            (viewHelper model)
        ]
    }


viewHelper : Model -> Element Msg
viewHelper model =
    Element.column []
        [ Element.el
            (buttonAttrs
                ++ [ Element.htmlAttribute (Html.Events.onClick (PopifyMsg Popify.ToggleHidden)) ]
            )
            (Element.text <| "Hide Popify")
        , Element.html (Html.map PopifyMsg (Popify.view model.popifyModel))
        ]


buttonAttrs : List (Attribute Msg)
buttonAttrs =
    [ Element.padding 5
    , Element.centerX
    , Element.centerY
    , Element.Background.color (Element.rgb255 200 200 200)
    , Element.mouseOver [ Element.Background.color (Element.rgb255 150 150 150) ]
    ]
