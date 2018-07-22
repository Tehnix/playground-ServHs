module Main where

import AWSLambda
import Data.Aeson.Alternative

import Handler (handler, handlerIntArray, handlerS3)


main :: IO ()
main =
  lambdaMain $ handlerIntArray `alternative` handlerS3 `alternative` handler
