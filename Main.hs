module Main where

import Control.Monad
import Happstack.Server (Conf(..), decodeBody, defaultBodyPolicy, dirs, nullConf, simpleHTTP)

import Imaging

serviceConf :: Conf
serviceConf = nullConf { port = 31000 }

tempDirectory = "D:\\Temp"
dataDirectory = "D:\\Temp\\Data"

main :: IO ()
main = simpleHTTP serviceConf $ do decodeBody (defaultBodyPolicy tempDirectory (10*10^6) 1000 1000)
                                   msum [ dirs "images/add" $ Imaging.addImage dataDirectory,
                                          dirs "images/view" $ Imaging.viewImage dataDirectory,
                                          dirs "images/web/add" $ Imaging.addImageWeb ]
