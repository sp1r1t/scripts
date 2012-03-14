import XMonad
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
                   { borderWidth        = 2
                   , terminal           = "urxvt"
                   , normalBorderColor  = "#222222"
                   , focusedBorderColor = "#440044" --"#cd8b00" 
                                          
                   , manageHook = manageDocks <+> manageHook defaultConfig
                   , layoutHook = avoidStruts  $  layoutHook defaultConfig
                   , logHook = dynamicLogWithPP xmobarPP
                               { ppOutput = hPutStrLn xmproc
                               , ppTitle = xmobarColor "green" "" . shorten 50
                               }
                   , modMask = mod4Mask -- Rebind Mod to Windows key
                   
                   } `additionalKeys`
                   [ ((mod4Mask .|. shiftMask,  xK_Return ), spawn "xterm")
                   ]