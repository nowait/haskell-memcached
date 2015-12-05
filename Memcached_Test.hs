module Main (main) where

import Network.Memcached.TestUtil     as TstUtl
import Test.Framework                 as TstFrm
import Test.Framework.Providers.HUnit as TstFrmHUnit
import Test.HUnit                     as HUnit

tests = TstFrmHUnit.hUnitTestToTests $ HUnit.TestList [
    TestCase ( TstUtl.setAndGet (42 :: Int) )
   ,TestCase ( TstUtl.setAndGet "blah"      )
   ,TestCase ( TstUtl.setAndGet 'c'         )
   ,TestCase ( TstUtl.setAndGet '0'         )
    ]

main :: IO ()
main = TstFrm.defaultMain tests
