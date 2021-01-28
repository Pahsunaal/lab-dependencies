{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_lab_dependencies (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Tim\\Documents\\CS141 Code\\lab-dependencies\\.stack-work\\install\\044d89d9\\bin"
libdir     = "C:\\Users\\Tim\\Documents\\CS141 Code\\lab-dependencies\\.stack-work\\install\\044d89d9\\lib\\x86_64-windows-ghc-8.8.4\\lab-dependencies-0.1.0.0-7KZbeN4POWd13en33xG7vy"
dynlibdir  = "C:\\Users\\Tim\\Documents\\CS141 Code\\lab-dependencies\\.stack-work\\install\\044d89d9\\lib\\x86_64-windows-ghc-8.8.4"
datadir    = "C:\\Users\\Tim\\Documents\\CS141 Code\\lab-dependencies\\.stack-work\\install\\044d89d9\\share\\x86_64-windows-ghc-8.8.4\\lab-dependencies-0.1.0.0"
libexecdir = "C:\\Users\\Tim\\Documents\\CS141 Code\\lab-dependencies\\.stack-work\\install\\044d89d9\\libexec\\x86_64-windows-ghc-8.8.4\\lab-dependencies-0.1.0.0"
sysconfdir = "C:\\Users\\Tim\\Documents\\CS141 Code\\lab-dependencies\\.stack-work\\install\\044d89d9\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lab_dependencies_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lab_dependencies_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lab_dependencies_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lab_dependencies_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab_dependencies_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab_dependencies_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
