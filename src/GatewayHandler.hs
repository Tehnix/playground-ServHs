{-# LANGUAGE OverloadedStrings #-}
module GatewayHandler where

import qualified AWSLambda.Events.APIGateway as Lambda
import AWSLambda.Events.APIGateway
  (APIGatewayProxyRequest, APIGatewayProxyResponse)
import Control.Lens ((&), (?~), (^.))
import qualified Data.HashMap.Strict as HashMap
import Data.Semigroup ((<>))
import Data.Text (Text)

handler :: APIGatewayProxyRequest Text -> IO (APIGatewayProxyResponse Text)
handler request = do
  putStrLn "This should go to logs"
  case HashMap.lookup "name" (request ^. Lambda.agprqPathParameters) of
    Just name ->
      return
        $  Lambda.responseOK
        &  Lambda.responseBody
        ?~ "Hello, "
        <> name
        <> "\n"
    Nothing -> return Lambda.responseNotFound
