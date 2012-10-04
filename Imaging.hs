module Imaging where

import Control.Monad.Trans (liftIO)
import System.Directory (renameFile)
import System.FilePath (combine, takeFileName)
import Text.Blaze ((!))
import Happstack.Server (Browsing(DisableBrowsing),
                         Response,
                         ServerPart,
                         lookFile,
                         ok,
                         serveDirectory,
                         toResponse)

import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

addImage :: String -> ServerPart Response
addImage dataDirectory = do file <- lookFile "image"
                            liftIO $ moveToDataDirectory file
                            ok $ toResponse "Ok"
                         where moveToDataDirectory (filepath, _, _) = let filename = (takeFileName filepath)
                                                                      in  renameFile filepath $ dataDirectory `combine` filename

addImageWeb :: ServerPart Response
addImageWeb = ok $ toResponse $ pageTemplate
              where pageTemplate = H.html $ do
                                        H.head $ do
                                            H.title (H.toHtml "leechnet")
                                        H.body $ do
                                            H.form ! A.action (H.toValue "../add") ! A.method (H.toValue "POST") ! A.enctype (H.toValue "multipart/form-data") $ do
                                                H.input ! A.name (H.toValue "image") ! A.type_ (H.toValue "file")
                                                H.input ! A.type_ (H.toValue "submit")
                

viewImage :: String -> ServerPart Response
viewImage dataDirectory = serveDirectory DisableBrowsing [] dataDirectory
