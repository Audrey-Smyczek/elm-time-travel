module TimeTravel exposing (addTimeTravel)

import Playground exposing (..)
import Set

addTimeTravel rawGame =
    { initialState = initialStateWithTimeTravel rawGame
    , updateState = updateWithTimeTravel rawGame
    , view = viewWithTimeTravel rawGame
    }

initialStateWithTimeTravel rawGame =
    { rawModel = rawGame.initialState
    , paused = False
    }
    
updateWithTimeTravel rawGame computer model =
    if keyPressed "T" computer then
        not model.paused
    else if keyPressed "R" computer then
        model.paused
    else if model.paused then
        model 
    else 
        {model | rawModel = rawGame.updateState computer model.rawModel}

viewWithTimeTravel rawGame computer model =
    rawGame.view computer model.rawModel

keyPressed keyName computer =
  [ String.toLower keyName
  , String.toUpper keyName
  ]
    |> List.any (\key -> Set.member key computer.keyboard.keys)
