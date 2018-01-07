# Setting Up Attacca DMX on a Fresh Raspbian Image

1. Flash the latest image of Raspbian Lite from raspberrypi.org to your MicroSD card.

1. Add an empty file called `ssh` to the `/boot` directory of the card.

1. Eject the card and insert it into your Pi

1. Plug in your USB sound card.

1. Connect power to the system.

1. Log in to your Pi over SSH as user `pi` with password `raspberry`.

1. Create the directory `~/.ssh`.

1. Inside `~/.ssh`, create the file `authorized_keys` and add your SSH key.

1. Run `sudo su` and repeat the last two steps.

1. Reboot and confirm that your SSH key works.

1. Uncomment or add this line in `/etc/ssh/sshd_config`:

		PermitRootLogin prohibit-password

1. Run `sudo raspi-config` and make these changes:

	1. Change your password.

	1. Set your hostname.

	1. Change your localization and timezone (if needed).

	1. Set video memory allocation to the minimum of 16 MB.

1. Reboot.

1. Run `sudo apt-get update && sudo apt-get upgrade`.

1. Run `sudo apt-get install ola`.

1. Disable unneeded plugins in OLA (e.g., at <http://sfx-player.local:9090>). You can do this by navigating to **New UI** (from the bottom of the page). From the **Plugins** tab, uncheck all plugins except the following:

	- **E1.31 (sACN)** or **ArtNet**, depending on your preferred DMX input

	If you need any of the other plugins, of course, leave them enabled.

1. Create the directories `/home/pi/music` and `/home/pi/playlists`.

1. Run `chgrp audio /home/pi/music /home/pi/playlists`.

1. Copy `asound.conf` to `/etc`.

1. Reboot.

1. Run `sudo apt-get install mpd mpc bc shairport-sync`. Leave out `shairport-sync` if you don't need the Pi to act as an Apple AirPlay audio receiver.

1. If you installed `shairport-sync`, you may want to copy `shairport-sync.conf` to `/etc` (overwriting the existing file if present). Feel free to customize this file.

1. Run `sudo systemctl stop mpd && sudo systemctl disable mpd`.

1. Copy these files to `/home/pi`:

		mpd@6600.conf
		mpd@6601.conf
		mpd@6602.conf
		olat_mpd.trigger
		olat_mpd.environment
		olat_mpd@6600.environment
		olat_mpd@6601.environment
		olat_mpd@6602.environment
		olat_sys.trigger
		olat_sys.environment
		olat_sys@1.environment
		olat_sys@2.environment

1. Copy `olat_*` control scripts and the binary `ws` to `/usr/local/bin`.

	Note: This binary of `ws` was compiled on Raspbian and is different from the one found at <https://github.com/yhat/ws/releases/download/v0.1/ws_linux_arm.zip>. See <https://github.com/yhat/ws> for source and other binaries.

1. Run `sudo chmod a+x /usr/local/bin/olat_* /usr/local/bin/ws`.

1. Copy these files to `/etc/systemd/system`:

		mpd@.service
		mpd@.socket
		mpd.target
		olat_mpd@.service
		olat_mpd.target
		olat_sys@.service
		olat_sys.target
		olat.target

1. Create these directories in `/etc/systemd/system`:

		olat_mpd.target.d
		olat_sys.target.d

1. Copy these files to `/etc/systemd/system/olat_mpd.target.d`:

		6600.conf
		6601.conf
		6602.conf

1. Copy these files to `/etc/systemd/system/olat_sys.target.d`:

		1.conf
		2.conf

1. At this point, you may add more instances of `olat_mpd@.service` or `olat_sys@.service` in the manner above. Just make sure there are matching `*.trigger`, `*.environment`, and (for `olat_mpd@.service`) `mpd@*.conf` files in `/home/pi`.

1. Run `sudo systemctl daemon-reload`. (Also do this whenever you've changed the `systemd` drop-ins mentioned in the last 3 steps.)

1. Set up your DMX universes in OLA (e.g., at <http://sfx-player.local:9090/>). This guide assumes you'll set up at least 2 universes. All the `olat_mpd@.service` daemons, as well as `olat_sys@1.service`, require Universe 1. `olat_sys@2.service` requires Universe 2. These requirements are configured in the various `*.environment` files copied to `/home/pi`. Adjust them as needed.

1. Run `sudo systemctl enable olat.target`.

1. Reboot.