{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Lib (hello)


main = scotty 3000 $ do
  get "/" $ do
    html "Hello World!"
  get "/func" $ do
    html hello
