Normally AFWall applies iptables rules when started.
It means if Internet access is enabled on boot it is possible to reach network overcoming AFWall rules BEFORE it starts.
This module will prevent it blocking internet access on boot BEFORE AFWall started and applied.

## Requirements ##
- AFWall (if not - the Internet access will be ALWAYS BLOCKED)


## ChangeLog ##
* v.1.0 First Release

* v.1.1 Enforced WiFi and Mobile Data block

* v.1.2 Added delay before enabling Internet back and automatic deleting of afwallstart

* v.1.3 Now automatic deleting of afwallstart is performing both from /data/adb/post-fs-data.d/ and /data/adb/system.d/ - I was reported it is necessary for A11

