module TimeTravel exposing (addTimeTravel)

import Playground exposing (..)
import Set

addTimeTravel rawGame =
    { initialState = initialStateWithTimeTravel rawGame
    , updateState = updateWithTimeTravel rawGame
    , view = viewWithTimeTravel rawGame
    }

initialStateWithTimeTravel rawGame =
    rawGame.initialState
    
updateWithTimeTravel rawGame computer model =
    rawGame.updateState computer model
    
viewWithTimeTravel rawGame computer model =
    rawGame.view computer model


