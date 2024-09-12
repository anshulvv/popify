module Popify exposing (..)

import Browser
import Html


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


type Msg
    = ToggleHidden


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ToggleHidden ->
            let
                newHidden =
                    if model.hidden then
                        False

                    else
                        True
            in
            ( { model | hidden = newHidden }, Cmd.none )
