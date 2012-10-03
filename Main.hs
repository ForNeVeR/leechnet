module Main where

import Control.Monad
import Happstack.Server (Conf(..), nullConf, simpleHTTP, dirs, ok)

configuration :: Conf
configuration = nullConf { port = 31000 }

main :: IO ()
main = simpleHTTP configuration $ msum [ dirs "stations/view" $ ok "Stations",
										 dirs "stations/add"  $ ok "Add station"]
