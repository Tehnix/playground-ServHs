module Handler
  ( handler
  , handlerIntArray
  , handlerS3
  )
where

import qualified Data.Aeson as Aeson
import AWSLambda.Events.S3Event (S3Event)

handler :: Aeson.Value -> IO String
handler evt = do
  putStrLn "This should go to logs"
  print evt
  pure "Went into handler"

handlerIntArray :: [Int] -> IO String
handlerIntArray values = do
  putStrLn "This should go to logs"
  pure $ "Highest value is " ++ show (maximum values)

handlerS3 :: S3Event -> IO String
handlerS3 _ = pure "S3 event received"
