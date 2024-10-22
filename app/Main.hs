{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Lib (hello)


main = scotty 3000 $ do
  get "/" $ do
    html "Hello World!"
  get "/func" $ do
    html hello
  get "/new" $ do                         -- handle GET request on "/" URL
    text "This was a GET request!"     -- send 'text/plain' response
  delete "/new" $ do
    html "This was a DELETE request!"  -- send 'text/html' response
  post "/new" $ do
    text "This was a POST request!"
  put "/new" $ do
    text "This was a PUT request!"
