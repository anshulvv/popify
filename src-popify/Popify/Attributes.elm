module Popify.Attributes exposing (..)

import Element exposing (..)
import Element.Border as Border
import Html.Attributes
import Popify.Msg exposing (Msg)


fillMinimum : Int -> Length
fillMinimum px =
    Element.fill
        |> Element.minimum px


fillMaximum : Int -> Length
fillMaximum px =
    Element.fill
        |> Element.maximum px


fillExact : Int -> Length
fillExact px =
    Element.fill
        |> Element.minimum px
        |> Element.maximum px


popupAttr : List (Attribute Msg)
popupAttr =
    [ Element.width (fillExact 400)
    , Element.height (fillExact 300)
    , Element.alignTop
    , Element.alignRight
    , Border.width 1
    , Border.color (Element.rgb255 255 0 0)
    , Border.rounded 20
    , Element.paddingXY 20 30
    , Element.htmlAttribute (Html.Attributes.style "position" "absolute")
    ]
