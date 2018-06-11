module MuSvc.APIHandlers where

import           Data.Aeson       (object, (.=))
import qualified Data.Aeson       as A
import qualified Web.Scotty.Trans as S

import           Lib.Prelude

import           MuSvc.Types

statusHandler :: S.ActionT LText MuSvcM ()
statusHandler = S.json $ object [ "message" .= A.String "hello-world" ]
