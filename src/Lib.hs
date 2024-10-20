module Lib 
    ( hello
    ) where

import qualified Data.Text.Lazy as TL

hello :: TL.Text
hello = TL.pack "Hello func!"
