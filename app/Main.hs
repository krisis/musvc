module Main where

import qualified Options.Applicative as OA

import           Lib.Prelude

import           API
import           MuSvc.Types

data MuOpts = MuOpts
              { muPort :: Int
              } deriving Show

muOptsParser :: OA.Parser MuOpts
muOptsParser = MuOpts
               <$> OA.option OA.auto
               ( OA.long "port"
                 <> OA.help "Microservice listen port"
                 <> OA.showDefault
                 <> OA.value 42000
                 <> OA.metavar "PORT" )

muOpts :: OA.ParserInfo MuOpts
muOpts = OA.info (muOptsParser <**> OA.helper)
  ( OA.fullDesc
  <> OA.progDesc "My microservice"
  <> OA.header "musvc - a bare-bones microservice" )

main :: IO ()
main = do
    port <- muPort <$> OA.execParser muOpts
    print $ "Listening on " ++ show port
    muServer port $ MuEnv "myMicroServer"
