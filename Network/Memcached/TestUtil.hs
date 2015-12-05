module Network.Memcached.TestUtil (setAndGet) where

import Network.Memcached.Memcached    as Cache
import Network.Memcached.Protocol     as Proto
import Network.Memcached.Serializable as Ser
import Network.Memcached.Server       as Srv
import Test.HUnit                     as HUnit

setAndGet :: (Ser.Serializable a, Eq a, Show a) => a -> IO ()
setAndGet theFacts = do
    let host   = "memcached"
        port   = Nothing        -- default: 11211
        expiry = Proto.Never
        flags  = Nothing

    conn   <- Srv.connect (configure expiry flags) host port
    status <- Cache.set conn "_setAndGet_"   theFacts
    assertBool "set was successful" status
    ma'am  <- Cache.get conn "_setAndGet_"
    assertEqual "Tell us what happened" (Just theFacts) ma'am

