# primo-new-ui-hackathon
PRIMO New UI Hackathon/Virtual Conference: Dec.12-Dec.16

# Dec 13 Javascript customization – using hoverID/showDirectives, incorporating existing NPMs and understanding the MVC architecture used in Primo

## Before you start

- Learn Javascript
- Get used to Git Tools
- Get used to NodeJS Tools
- Get used to at least one Javascript Debugger (Browser)

# Installation of Primo New UI Development Environment on Linux

## Choose your favourite Linux

- Ubuntu
- Fedora Core (used in this demo)
- Debian

## Install latest nodejs 4.x and npm

```shell
$ dnf install -y nodejs npm
$ rpm -q npm nodejs
npm-2.15.9-6.fc24.x86_64
nodejs-4.6.1-6.fc24.x86_64
```

## Install gulp

```shell
cd ~/
npm install gulp
```

Ensure that glup is in your path, adjust ~/.bash_profile

```shell
$ cat ~/.bash_profile 
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/node_modules/.bin

export PATH
```





If your Linux Distribution does not include nodejs 4.x install from nodejs.org

- https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora

## Clone primo-explore-devenv and package from github

### Script step1.sh

```shell
#!/bin/sh

git clone https://github.com/ExLibrisGroup/primo-explore-devenv.git
git clone https://github.com/ExLibrisGroup/primo-explore-package.git

sed -i 's/your-server:your-port/search.obvsg.at:80/' primo-explore-devenv/gulp/config.js

cp -av primo-explore-package/VIEW_CODE primo-explore-devenv/primo-explore/custom/ACC

cd primo-explore-devenv && npm install
```

### First run

```shell
[ulrich@think primo-explore-devenv]$ gulp run --view ACC
module.js:327
    throw err;
    ^

Error: Cannot find module 'through2'
    at Function.Module._resolveFilename (module.js:325:15)
    at Function.Module._load (module.js:276:25)
    at Module.require (module.js:353:17)
    at require (internal/module.js:12:17)
    at Object.<anonymous> (/home/ulrich/PRIMO-New-UI-Hackathon/primo-explore-devenv/gulp/cssSplitter.js:2:15)
    at Module._compile (module.js:409:26)
    at Object.Module._extensions..js (module.js:416:10)
    at Module.load (module.js:343:32)
    at Function.Module._load (module.js:300:12)
    at Module.require (module.js:353:17)
```

### Install missing node-modules

```shell
[ulrich@think primo-explore-devenv]$ npm install through2 vinyl-sourcemaps-apply gulp-util
```

### Second run

```shell
[ulrich@think primo-explore-devenv]$ gulp run --view ACC
[22:21:58] Using gulpfile ~/PRIMO-New-UI-Hackathon/primo-explore-devenv/gulpfile.js
[22:21:58] Starting 'connect:primo_explore'...
[22:21:58] Finished 'connect:primo_explore' after 35 ms
[22:21:58] Starting 'watch-js'...
[22:21:58] Finished 'watch-js' after 7.99 ms
[22:21:58] Starting 'watch-css'...
[22:21:58] Finished 'watch-css' after 1.19 ms
[22:21:58] Starting 'setup_watchers'...
[22:21:58] Finished 'setup_watchers' after 2.32 ms
[22:21:58] Starting 'custom-js'...
[22:21:58] Starting 'custom-css'...
[22:21:58] Finished 'custom-js' after 26 ms
[22:21:58] Finished 'custom-css' after 14 ms
[22:21:58] Starting 'run'...
[22:21:58] Finished 'run' after 5.88 μs
[BS] Access URLs:
 --------------------------------------
       Local: http://localhost:8003
    External: http://192.168.1.153:8003
 --------------------------------------
          UI: http://localhost:3001
 UI External: http://192.168.1.153:3001
 --------------------------------------
[BS] Serving files from: primo-explore
```
