{-# LANGUAGE DeriveDataTypeable #-}
module Imaging where

import Control.Monad.Trans (liftIO)
import Data.Data (Data, Typeable)
import Happstack.Server
import System.Directory (renameFile)
import System.FilePath (combine, takeFileName)
import Text.Blaze ((!))
import Text.JSON.Generic (encodeJSON)

import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as At

data ImageAddress = ImageAddress { uri :: String } deriving (Data, Typeable)

addImage :: String -> ServerPart Response
addImage dataDirectory = do file <- lookFile "image"
                            filename <- liftIO $ moveToDataDirectory file
                            ok $ toResponse $ encodeJSON $ ImageAddress { uri = filename }
                         where moveToDataDirectory (filepath, _, _) = let filename = (takeFileName filepath)
                                                                      in  do renameFile filepath $ dataDirectory `combine` filename
                                                                             return filename

addImageWeb :: ServerPart Response
addImageWeb = ok $ toResponse $ pageTemplate
              where pageTemplate = H.html $ do
                                        H.head $ do
                                            H.title (H.toHtml "leechnet")
                                        H.body $ do
                                            H.form ! At.action (H.toValue "../add") ! At.method (H.toValue "POST") ! At.enctype (H.toValue "multipart/form-data") $ do
                                                H.input ! At.name (H.toValue "image") ! At.type_ (H.toValue "file")
                                                H.input ! At.type_ (H.toValue "submit")
                

viewImage :: String -> ServerPart Response
viewImage dataDirectory = serveDirectory DisableBrowsing [] dataDirectory
