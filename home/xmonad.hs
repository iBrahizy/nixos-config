import XMonad

import XMonad.Util.EZConfig

main :: IO ()
main = xmonad $ def
    { modMask = mod4Mask  -- Rebind Mod to the Super key
    }

terminal:: String
terminal = "alacritty"
