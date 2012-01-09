# contents of the vpn_restart.scpt script:

tell application "System Events"
tell current location of network preferences
set Modemdailup to service "VPN (PPTP)"
if exists Modemdailup then disconnect Modemdailup
end tell
end tell

delay 3

tell application "System Events"
tell current location of network preferences
set Modemdailup to service "VPN (PPTP)"
if exists Modemdailup then connect Modemdailup
end tell
end tell

# end contents of the vpn_restart.scpt script:
