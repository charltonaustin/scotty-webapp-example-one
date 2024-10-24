{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
    ( captureParam,
      delete,
      get,
      html,
      matchAny,
      notFound,
      queryParam,
      post,
      put,
      scotty,
      setHeader,
      status,
      text )
import Lib (hello)
import Network.HTTP.Types


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
  -- set a header:
  post "/set-headers" $ do
   status status302  -- Respond with HTTP 302 status code
   setHeader "Location" "http://www.google.com.au"
  -- named parameters:
  get "/askfor/:word" $ do
    w <- captureParam "word"
    html $ mconcat ["<h1>You asked for ", w, ", you got it!</h1>" ]
  -- unnamed parameters from a query string or a form:
  post "/submit" $ do  -- e.g. http://server.com/submit?name=somename
   name <- queryParam "name"
   text name
  -- match a route regardless of the method
  matchAny "/all" $ do
   text "matches all methods"
  -- handler for when there is no matched route
  -- (this should be the last handler because it matches all routes)
  notFound $ do
   text "there is no such route."
