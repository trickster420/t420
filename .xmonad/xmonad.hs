import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
xmproc <- spawnPipe "xmobar"
xmonad $ defaultConfig
 { manageHook = manageDocks <+> manageHook defaultConfig
 , layoutHook = avoidStruts $ layoutHook defaultConfig
 , logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      }
   , modMask = mod4Mask
   , terminal = "rxvt"
 }  `additionalKeys`
 [(( mod4Mask , xK_f), spawn "firefox")
  , ((mod4Mask , xK_g), spawn "gedit")
  , ((mod4Mask , xK_p), spawn "pidgin")
  , ((mod4Mask , xK_t), spawn "thunar")
  , ((mod4Mask .|. mod1Mask, xK_g), spawn "google-earth")
  , ((mod4Mask .|. mod1Mask, xK_k), spawn "keepass")
  , ((mod4Mask .|. mod1Mask, xK_m), spawn "minecraft")]
