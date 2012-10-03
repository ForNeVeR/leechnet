module Imaging where

import Happstack.Server (Browsing(DisableBrowsing),
                         Response,
                         ServerPartT,
                         ok,
                         serveDirectory)

addImage :: ServerPartT IO [Char]
addImage = ok "Ok"

viewImage :: ServerPartT IO Response
viewImage = serveDirectory DisableBrowsing [] "./data"
