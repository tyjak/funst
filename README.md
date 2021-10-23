<p align="center">
·▄▄▄▄• ▄▌ ▐ ▄ .▄▄ · ▄▄▄▄▄
▐▄▄·█▪██▌•█▌▐█▐█ ▀. •██  
██▪ █▌▐█▌▐█▐▐▌▄▀▀▀█▄ ▐█.▪
██▌.▐█▄█▌██▐█▌▐█▄▪▐█ ▐█▌·
▀▀▀  ▀▀▀ ▀▀ █▪ ▀▀▀▀  ▀▀▀ 
<br><sub>✨ Download and display album art or display embedded album art  ✨</sub></p>
```funst``` is a fork of ```kunst``` by Siddharth Dushantha (Copyright © 2019)

```funst``` is a daemon that extracts the album art from the songs playing in ```mpd``` and displays them in a notification or ont the i3lock screen. It doesn't loop on a timer, instead it waits for ```mpd``` to send a ```player``` event. When it receives a ```player``` event, it wakes up and extracts the album art of the current playing track. This makes ```funst```really lightweight and makes it idle at ```~0%``` CPU usage. If there no embbeded album art, it will try to fetch the album art from the internet.


<p align="left">
<img src="extra/demo.gif">
</a>
</p>

## Dependencies
- ```sxiv``` or ```imv```
- ```dunst``` or any compatible with ```notify-send```
- ```bash```
- ```ffmpeg```
- ```mpc```
- ```jq```
- ```mpd```


## Installation
### Install using ```make```
```bash
# Clone the repo
$ git clone https://github.com/tyjak/funst

# Change your current directory to funst
$ cd funst

# Install it
$ sudo make install
```
### Install it locally

```bash
# Download the funst source code, save as funst, make it executeable
# and then move it to ~/.local/bin
$ curl -L git.io/raw-funst > funst && chmod +x funst && mv funst ~/.local/bin
```

### Install as a systemd service

```bash
# Copy funst.service to /usr/lib/systemd/user
# and enable / start the service
$ cp funst.service /usr/lib/systemd/user/ && systemctl --user enable --now funst.service
```

## Usage

```bash
$ funst --help
usage: funst [-h] [--size px] [--music_dir path/to/dir] [--silent] [--notify-send] [--version]



·▄▄▄▄• ▄▌ ▐ ▄ .▄▄ · ▄▄▄▄▄
▐▄▄·█▪██▌•█▌▐█▐█ ▀. •██  
██▪ █▌▐█▌▐█▐▐▌▄▀▀▀█▄ ▐█.▪
██▌.▐█▄█▌██▐█▌▐█▄▪▐█ ▐█▌·
▀▀▀  ▀▀▀ ▀▀ █▪ ▀▀▀▀  ▀▀▀ 
Download and display album art or display embedded album art

optional arguments:
   -h, --help            show this help message and exit
   --size                what size to display the album art in
   --position            the position where the album art should be displayed
   --music_dir           the music directory which MPD plays from
   --silent              dont show the output
   --notify-send         send album image in a notification along side with artist, title and duration
   --version             show the version of funst you are using
```


## Configure
You can configure `funst` through environment variables.

```bash
# The size of the album art to be displayed
export FUNST_SIZE="250x250"

# The position where the album art should be displayed
export FUNST_POSITION="+0+0"

# Where your music is located
export FUNST_MUSIC_DIR="/home/username/Music/"

# To display notification with tiny art cover instead of the full album art cover
export FUNST_MODE="notify"
```

If you've installed as a service then you need to configure env var as follow:

```bash
# Edit the funst service
$ systemctl --user edit funst.service

# Put env var in the edited file
[Service]
environment="FUNST_ICONSIZE=70x70"
environment="FUNST_MODE=notify"
```


## License
MIT License
Copyright © 2019 Siddharth Dushantha
Copyright © 2020 David Foucher
