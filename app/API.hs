module API
    ( muServer
    ) where

import qualified Web.Scotty.Trans  as S

import           Lib.Prelude

import           MuSvc.APIHandlers
import           MuSvc.Types

muAPI :: S.ScottyT LText MuSvcM ()
muAPI = do
    S.get "/api/v1/status" statusHandler
    -- other API routes will be declared below

muServer :: Int -> MuEnv -> IO ()
muServer port env = do
    let runIO m = runReaderT (unMuSvcM m) env
    S.scottyT port runIO muAPI
