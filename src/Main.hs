{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Model
import qualified Database.Persist.Postgresql as Post
import Database.Persist
import Control.Monad.Logger (runStderrLoggingT)
import Control.Monad.IO.Class (liftIO)
import ClassyPrelude

connstr = "host=localhost dbname=ardfard user=ardfard port=5432"
main :: IO ()
main = 
    runStderrLoggingT $ Post.withPostgresqlPool connstr 10 $ \pool -> liftIO $ 
        flip Post.runSqlPersistMPool pool $ do 
            Post.runMigration migrateAll
            id <- insert $ Product "PS4" "Console" 2050000 10
            products <- selectList [] [LimitTo 1]
            liftIO $ print (products :: [Entity Product])

