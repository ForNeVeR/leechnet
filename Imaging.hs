module Imaging where

import System.Directory (renameFile)
import Happstack.Server (Browsing(DisableBrowsing),
                         Response,
                         ServerPart,
                         lookFile,
                         ok,
                         serveDirectory,
                         toResponse)

dataDirectory :: [Char]
dataDirectory = "./data"

addImage :: ServerPart Response
addImage = do file <- lookFile "image"
              liftIO $ moveToDataDirectory file
              ok $ toResponse "Ok"
           where moveToDataDirectory (filename, _, _) = renameFile filename (dataDirectory ++ "/" ++ filename)

viewImage :: ServerPart Response
viewImage = serveDirectory DisableBrowsing [] dataDirectory
