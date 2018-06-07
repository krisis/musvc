module API
    ( muServer
    ) where

import           Data.Aeson       (object, (.=))
import qualified Data.Aeson       as A
import qualified Web.Scotty.Trans as S

import           Lib.Prelude

import           MuSvc.Types

muAPI :: S.ScottyT LText MuSvcM ()
muAPI = do
    S.get "/api/v1/status" $ do S.json $ object [ "message" .= A.String "hello" ]
    -- other API routes will be declared below

muServer :: Int -> MuEnv -> IO ()
muServer port env = do
    let runIO m = runReaderT (unMuSvcM m) env
    S.scottyT port runIO muAPI
