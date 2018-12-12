
# the code below is retrieved from https://www.coresolutiongroup.com/tech-blog/ard-apple-remote-desktop-kickstart-in-10-14-mac-os-mojave

## ARD enablement via Apple ARD groups
if [[ $(dscl /Local/Default list /Groups | grep "$com.apple.local.ard_admin" | wc -l) -eq 0 ]]; then
 /usr/sbin/dseditgroup -o create -n "/Local/Default" -r "ARD Admin Group" -T group com.apple.local.ard_admin
fi

# add desired user to above ARD groups
# DO NOT REMOVE THE "<>"
/usr/sbin/dscl . append /Groups/com.apple.local.ard_admin user <yourARDuserShortname>

/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -clientopts -setdirlogins -dirlogins yes

# in theory if the above does not work, then uncomment the lines below
# this is my code, it enables remote management via system prefs.
# systemsetup -setremotelogin on
# this next line is completely experimental and should be used as a last resort.
# launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
# it uses the launchctl Launch Daemon. Use as a last resort as otherwise this can cause security issues.
# /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -allowAccessFor -specifiedUsers
# /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -users usernamegoeshere -access -on -privs -all -setmenuextra -menuextra no -restart -agent
