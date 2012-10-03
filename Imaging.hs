module Imaging where

import Happstack.Server(ServerPartT, ok)

addImage :: ServerPartT IO [Char]
addImage = ok "Ok"