module Main where

import Handler (handler)
import AWSLambda

main :: IO ()
main = lambdaMain handler

