module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Erl.Process (PROCESS, (!), spawn, receive)

type Person = { first :: String,
                last :: String }

logger = do
    s :: String <- receive
    log $ "Received: " <> s

main :: forall e. Eff (console :: CONSOLE, process :: PROCESS | e) Unit
main = do
  let joe = { first: "Joe", last: "Smith" }
  p <- spawn logger
  log $ "Hello, " <> joe.first <> "!"
  p ! "bye!"
