module Imaging where

import Happstack.Server (Browsing(DisableBrowsing),
                         Response,
                         ServerPart,
                         ok,
                         serveDirectory,
                         toResponse)

addImage :: ServerPart Response
addImage = ok $ toResponse "Ok"

viewImage :: ServerPart Response
viewImage = serveDirectory DisableBrowsing [] "./data"
