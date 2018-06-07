{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module MuSvc.Types where

import qualified UnliftIO    as U

import           Lib.Prelude

data MuEnv = MuEnv
    { muName :: Text -- sample placeholder environment
    } deriving Show

newtype MuSvcM a = MuSvcM
    { unMuSvcM :: ReaderT MuEnv IO a
    } deriving (Applicative, Functor, Monad, MonadIO, MonadReader MuEnv)

instance U.MonadUnliftIO MuSvcM where
    askUnliftIO = MuSvcM $ ReaderT $
                  \r -> U.withUnliftIO $
                  \u -> return $
                        U.UnliftIO (U.unliftIO u. flip runReaderT r . unMuSvcM)
