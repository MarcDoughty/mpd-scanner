# mpd-scanner


This is a demonstration project that is both handy and introduces a few concepts.

1. There's a code workflow through GitHub.
2. There's a Docker container running Kali Linux that we can run on any system that can run Linux containers.
3. There's a simple bash script with options we can pass to it for different scans.
4. There's persistent storage on the host.

# Getting the Code
 1. CD to a place on your computer you want the project to live.
 2. Run 'git clone https://github.com/MarcDoughty/mpd-scanner.git'
 3. CD to 'mpd-scanner'
 4. Read through the project, starting from the Dockerfile and ending in scanner.sh.

# Building and Updating the container
To build or update the container, CD to the project directory and run
```docker pull kalilinux/kali-rolling
```docker build . -t mpd-scanner

# Using
To run the scanner, run this command:
```docker run -e SCANTYPE=portscan --mount type=bind,source=/your/project/folder/foundry/mpd-scanner,target=/mount/mpd-scanner mpd-scanner /mount/mpd-scanner/scanner.sh
