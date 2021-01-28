module Lib where
import qualified Data.Set as S 

someFunc :: IO ()
someFunc = putStrLn "someFunc"

set :: S.Set Int 
set = S.union (S.fromList [0..5]) (S.fromList [3..10])