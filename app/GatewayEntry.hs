module Main where

import AWSLambda.Events.APIGateway (apiGatewayMain)
import GatewayHandler (handler)

main :: IO ()
main = apiGatewayMain handler
