{-# LANGUAGE OverloadedStrings, ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

module Blockchain.Data.Block (
  BlockData (..),
  Block (..),
  migrateAll
  ) where

import Database.Persist
import Database.Persist.Types
import Database.Persist.TH
import Database.Persist.Postgresql

import Data.Time
import Data.Time.Clock.POSIX
import Data.ByteString as B

import Blockchain.Data.AddressState
import Blockchain.Data.Address
import Blockchain.SHA
import Blockchain.Data.SignedTransaction
import Blockchain.Util

import Blockchain.Database.MerklePatricia.SHAPtr



--import Debug.Trace


{-
share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
BlockData
    parentHash SHA
    unclesHash SHA
    coinbase Address
    stateRoot SHAPtr
    transactionsRoot SHAPtr
    receiptsRoot SHAPtr
    logBloom B.ByteString
    difficulty Integer
    number Integer
    gasLimit Integer
    gasUsed Integer
    timestamp UTCTime
    extraData Integer
    nonce SHA
    deriving Show Read Eq

Block
    blockData BlockData
    receiptTransactions [SignedTransaction]
    blockUncles [BlockData]
    deriving Show Read Eq
|]

{-
data BlockData = BlockData {
  parentHash::SHA,
  unclesHash::SHA,
  coinbase::Address,
  bStateRoot::SHAPtr,
  transactionsRoot::SHAPtr,
  receiptsRoot::SHAPtr,
  logBloom::B.ByteString,
  difficulty::Integer,
  number::Integer,
  gasLimit::Integer,
  gasUsed::Integer,
  timestamp::UTCTime,
  extraData::Integer,
  nonce::SHA
} deriving (Show, Read, Eq)

data Block = Block {
  blockData::BlockData,
  receiptTransactions::[SignedTransaction],
  blockUncles::[BlockData]
  } deriving (Show, Read, Eq)
-}
--derivePersistField "BlockData"
--derivePersistField "Block"

-}
