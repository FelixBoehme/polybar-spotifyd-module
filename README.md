# polybar-spotifyd-module
This polybar module displays current information on the song playing on Spotify. It also provides you with controls.
The module directly communicates with the spotifyd daemon and is intended for the use with spotify-tui.

## Requirements
You will need these dependencies/scripts in order for the module to work:

- [Spotifyd](https://github.com/Spotifyd/spotifyd)
- [Spotify TUI](https://github.com/Rigellute/spotify-tui)
- change_volume.sh
- change_symbol.sh (not necessarily needed but used by default)

The latter isn't necessarily required but enabled by default. If the change of the start and stop symbol isn't desired any reference to it in the code has to be removed in order for it to work.

You will need to add the provided scripts to your polybar folder (you might have to change the paths to the scripts depending on the location of your polybar config).

## Setup
Create a new section for the spotifyd module. Currently the modules are only shown when the spotify-tui process is running, to make it rely on another process running change `spt` with `processname`:  
  ```INI
  [section/spotifyd]
  type = custom/script
  exec-if = ps -A | grep spt
  interval = 1
  ```
  
Add the module for track and artist information including a Spotify logo in the primary colour:
  ```INI
  [module/spotifyd]
  inherit = section/spotifyd 
  exec = spt pb --status -f %t\ -\ %a
  format-prefix = " "
  format-prefix-foreground = ${colors.primary}
  scroll-up = $HOME/.config/polybar/change_volume.sh -10
  scroll-down = $HOME/.config/polybar/change_volume.sh +10
  ```
    
Add the control interfac modules:
  ```INI
  [module/spotifyd-previous]
  inherit = section/spotifyd
  exec = echo "⏮"
  click-left = spt pb --previous
  
  [module/spotifyd-play-pause]
  inherit = section/spotifyd
  exec = $HOME/.config/polybar/change_symbol.sh
  click-left = spt pb --toggle
  
  [module/spotifyd-next]
  inherit = section/spotifyd
  exec = echo "⏭"
  click-left = spt pb --next
  ```
