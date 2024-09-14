module Popify exposing (..)

import Browser
import Element exposing (Element, el)
import Element.Border as Border
import Html
import Popify.Attributes
import Popify.Msg exposing (Msg)


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( { hidden = False }, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


view : Model -> Html.Html Msg
view model =
    if model.hidden then
        Html.div [] [ Html.text <| "WRITING SOMETHING HERE TO CHECK" ]

    else
        Html.p [] []


type alias Model =
    { hidden : Bool
    }


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Popify.Msg.ToggleHidden ->
            let
                newHidden =
                    if model.hidden then
                        False

                    else
                        True
            in
            ( { model | hidden = newHidden }, Cmd.none )


popup : Model -> Element Msg
popup model =
    el Popify.Attributes.popupAttr
        (el
            -- Popify.Attributes.popupAttr
            [ Border.width 2 ]
            (Element.text <| "Chec")
        )
