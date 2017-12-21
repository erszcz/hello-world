module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

type Person = { first :: String,
                last :: String }

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  let joe = { first: "Joe", last: "Smith" }
  log $ "Hello, " <> joe.first <> "!"
