------------------------------------------------------------------------
-- IMPORTS
------------------------------------------------------------------------
import Colors
import qualified Data.Map as M
import Data.Monoid
import System.Exit
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.MouseResize
import XMonad.Hooks.DynamicLog (PP (..), dynamicLogWithPP, shorten, wrap, xmobarColor, xmobarPP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (ToggleStruts (..), avoidStruts, docksEventHook, manageDocks)
import XMonad.Hooks.WorkspaceHistory
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows
  ( decreaseLimit,
    increaseLimit,
    limitWindows,
  )
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.WindowArranger
  ( WindowArrangerMsg (..),
    windowArrange,
  )
import XMonad.Layout.WindowNavigation
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------
myTerminal :: String
myTerminal = "termite"

myFont :: String
myFont = "xft:Noto Sans:size=10:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask -- Sets modkey to super/windows key

myBrowser :: String
myBrowser = "brave"

myEditor :: String
myEditor = "nvim"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True -- Whether focus follows the mouse pointer.

myClickJustFocuses :: Bool
myClickJustFocuses = False -- Whether clicking on a window to focus also passes the click to the window

myNormColor :: String
myNormColor = color8 -- Border color of normal windows

myFocusColor :: String
myFocusColor = color1 -- Border color of focused windows

myBorderWidth = 2 -- Width of the window border in pixels.

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

------------------------------------------------------------------------
-- WORKSPACES
------------------------------------------------------------------------
myShowWNameTheme :: SWNConfig
myShowWNameTheme =
  def
    { swn_font = "xft:Ubuntu:bold:size=60",
      swn_fade = 1.0,
      swn_bgcolor = "#1c1f24",
      swn_color = "#ffffff"
    }

myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
  where
    doubleLts '<' = "<<"
    doubleLts x = [x]

myClickableWorkspaces :: [String]
myClickableWorkspaces =
  clickable . (map xmobarEscape) $
    [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
  where
    clickable l =
      [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>"
        | (i, ws) <- zip [1 .. 9] l,
          let n = i
      ]

------------------------------------------------------------------------
-- BORDERS
------------------------------------------------------------------------
myNormalBorderColor = "#dddddd"

myFocusedBorderColor = "#ff0000"

------------------------------------------------------------------------
-- KEYBINDS
------------------------------------------------------------------------
myKeys :: [(String, X ())]
myKeys =
  [ ("M-S-<Backspace>", io exitSuccess), -- Quit xmonad
    ("M-<Backspace>", spawn "xmonad --recompile; xmonad --restart"), -- Restart xmonad
    ("M-d", spawn "dmenu_run"), -- launch dmenu
    ("M-<Return>", spawn (myTerminal)), -- launch a terminal
    ("M-e", spawn "termite -e ranger"), -- launch ranger
    ("M-c", spawn "termite -e cmus"), -- launch cmus
    ("M-S-q", kill), -- close focused window
    ("M-<Tab>", windows W.focusDown), -- Move focus to the next window
    ("M-j", windows W.focusDown), -- Move focus to the next window
    ("M-k", windows W.focusUp), -- Move focus to the previous window
    ("M-m", windows W.focusMaster), -- Move focus to the master window
    ("M-S-<Return>", windows W.swapMaster), -- Swap the focused window and the master window
    ("M-S-j", windows W.swapDown), -- Swap the focused window with the next window
    ("M-S-k", windows W.swapUp), -- Swap the focused window with the previous window
    ("M-h", sendMessage Shrink), -- Shrink the master area
    ("M-l", sendMessage Expand), -- Expand the master area
    ("M-t", withFocused $ windows . W.sink), -- Push window back into tiling
    ("M-i", sendMessage (IncMasterN 1)), -- Increment the number of windows in the master area
    ("M-S-i", sendMessage (IncMasterN (-1))), -- Deincrement the number of windows in the master area
    ("M-<Space>", sendMessage NextLayout), -- Rotate through the available layout algorithms
    ("M-n", refresh) -- Resize viewed windows to the correct size
  ]

------------------------------------------------------------------------
-- LAYOUTS
------------------------------------------------------------------------
tall =
  renamed [Replace "tall"] $
    windowNavigation $
      limitWindows 12 $
        mySpacing 4 $
          ResizableTall 1 (3 / 100) (1 / 2) []

monocle =
  renamed [Replace "monocle"] $
    windowNavigation $
      limitWindows 20 Full

floats =
  renamed [Replace "floats"] $
    windowNavigation $
      limitWindows 20 simplestFloat

myLayoutHook = avoidStruts $ mouseResize myDefaultLayout
  where
    myDefaultLayout = tall ||| monocle ||| floats

------------------------------------------------------------------------
-- WINDOW RULES
------------------------------------------------------------------------

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook =
  composeAll
    [ className =? "MPlayer" --> doFloat,
      className =? "Gimp" --> doFloat,
      resource =? "desktop_window" --> doIgnore,
      resource =? "kdesktop" --> doIgnore
    ]

------------------------------------------------------------------------
-- EVENT HOOKS
------------------------------------------------------------------------

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook

--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook :: X ()
myEventHook = mempty

------------------------------------------------------------------------
-- STATUSBAR AND LOGGING
------------------------------------------------------------------------

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook :: X ()
myLogHook = mempty

------------------------------------------------------------------------
-- STARTUP
------------------------------------------------------------------------

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "~/.local/share/dwm/autostart.sh"

------------------------------------------------------------------------
-- MAIN
------------------------------------------------------------------------

-- Run xmonad with the settings you specify. No need to modify this.
--
main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
  xmonad $
    ewmh
      def
        { manageHook = myManageHook <+> manageDocks,
          modMask = myModMask,
          terminal = myTerminal,
          startupHook = myStartupHook,
          workspaces = myWorkspaces,
          borderWidth = myBorderWidth,
          normalBorderColor = myNormColor,
          focusedBorderColor = myFocusColor,
          layoutHook = myLayoutHook,
          handleEventHook = docksEventHook,
          logHook =
            workspaceHistoryHook
              <+> dynamicLogWithPP
                xmobarPP
                  { ppOutput = \x -> hPutStrLn xmproc x,
                    ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]", -- Current workspace in xmobar
                    ppVisible = xmobarColor "#98be65" "", -- Visible but not current workspace
                    ppHidden = xmobarColor "#82AAFF" "" . wrap "*" "", -- Hidden workspaces in xmobar
                    ppHiddenNoWindows = xmobarColor "#c792ea" "", -- Hidden workspaces (no windows)
                    ppTitle = xmobarColor "#b3afc2" "" . shorten 60, -- Title of active window in xmobar
                    ppSep = "<fc=#666666> <fn=2>|</fn> </fc>", -- Separators in xmobar
                    ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!", -- Urgent workspace
                    ppOrder = \(ws : l : t : ex) -> [ws, l] ++ ex ++ [t]
                  }
        }
      `additionalKeysP` myKeys
