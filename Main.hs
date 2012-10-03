module Main where

import Control.Monad
import Happstack.Server (Conf(..), dirs, nullConf, simpleHTTP)

import Imaging

serviceConf :: Conf
serviceConf = nullConf { port = 31000 }

main :: IO ()
main = simpleHTTP serviceConf $ msum [ dirs "images/add" $ Imaging.addImage,
                                       dirs "images/view" $ Imaging.viewImage ]
