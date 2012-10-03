module Main where

import Happstack.Server (Conf(..), nullConf, simpleHTTP, toResponse, ok)

configuration :: Conf
configuration = nullConf { port = 31000 }

main :: IO ()
main = simpleHTTP configuration $ ok "Hello, World!"
