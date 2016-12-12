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

# Basic CSS Customization

## Script step2.sh

```script
#!/bin/sh

unzip -x -d primo-explore-devenv/primo-explore/custom/ ACC-img-css.zip
```

```shell
[ulrich@think PRIMO-New-UI-Hackathon]$ ./step2.sh 
Archive:  ACC-img-css.zip
  inflating: primo-explore-devenv/primo-explore/custom/ACC/img/library-logo.png  
  inflating: primo-explore-devenv/primo-explore/custom/ACC/img/primo-logo.png  
  inflating: primo-explore-devenv/primo-explore/custom/ACC/img/bg_logo.jpg  
  inflating: primo-explore-devenv/primo-explore/custom/ACC/img/favicon.ico  
  inflating: primo-explore-devenv/primo-explore/custom/ACC/js/custom.module.js  
  inflating: primo-explore-devenv/primo-explore/custom/ACC/css/zzz-colors.css  
  inflating: primo-explore-devenv/primo-explore/custom/ACC/css/app-colors.css
```

## Third run

```shell
[ulrich@think primo-explore-devenv]$ gulp run --view ACC
[22:46:17] Using gulpfile ~/PRIMO-New-UI-Hackathon/primo-explore-devenv/gulpfile.js
[22:46:17] Starting 'connect:primo_explore'...
[22:46:17] Finished 'connect:primo_explore' after 34 ms
[22:46:17] Starting 'watch-js'...
[22:46:17] Finished 'watch-js' after 7.76 ms
[22:46:17] Starting 'watch-css'...
[22:46:17] Finished 'watch-css' after 1.42 ms
[22:46:17] Starting 'setup_watchers'...
[22:46:17] Finished 'setup_watchers' after 823 μs
[22:46:17] Starting 'custom-js'...
[22:46:17] Starting 'custom-css'...
[BS] Access URLs:
 --------------------------------------
       Local: http://localhost:8003
    External: http://192.168.1.153:8003
 --------------------------------------
          UI: http://localhost:3001
 UI External: http://192.168.1.153:3001
 --------------------------------------
[BS] Serving files from: primo-explore
[22:46:18] Finished 'custom-js' after 1.15 s
[22:46:18] Finished 'custom-css' after 1.14 s
[22:46:18] Starting 'run'...
[22:46:18] Finished 'run' after 25 μs
[BS] Reloading Browsers...
[BS] 1 file changed (custom1.css)
custom/ACC
{ viewJs: [ 'custom/ACC/js/custom.js' ],
  centralJs: '',
  viewCss: [ 'custom/ACC/css/custom1.css' ],
  centralCss: '',
  favIcon: [ 'custom/ACC/img/favicon.ico' ],
  libraryLogo: 'custom/ACC/img/library-logo.png',
  resourceIcons: {},
  staticHtml: { homepage: { en_US: 'custom/ACC/html/home_en_US.html' } } }

```


## Directory Structure of primo-explore-devenv/primo-explore/custom/ACC

```shell
[ulrich@think custom]$ tree ACC
ACC
├── css
│   ├── app-colors.css
│   ├── custom1.css
│   ├── README.md
│   └── zzz-colors.css
├── html
│   ├── home_en_US.html
│   └── README.md
├── img
│   ├── bg_logo.jpg
│   ├── favicon.ico
│   ├── library-logo.png
│   ├── primo-logo.png
│   └── README.md
├── js
│   ├── custom.js
│   ├── custom.module.js
│   └── README.md
├── README.md
└── showDirectives.txt
```

## Gulp Tasks

### custom-css
- custom1.css = app-colors.css + zzz-colors.css

### custom-js
- custom.js =  function wrapper + custom.module.js


# Adding a Hello World Component

## VIEW_CODE/showDirectives.txt Bookmarklet

```
javascript:(function(){var script=document.createElement("SCRIPT");script.src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js';script.type='text/javascript';document.getElementsByTagName("head")[0].appendChild(script);var checkReady=function(callback){if(window.jQuery){callback(jQuery)}else{window.setTimeout(function(){checkReady(callback)},100)}};checkReady(function($){$('primo-explore').find('*[parent-ctrl="ctrl"]').each(function(){$(this).append('<a href="#" title="'+$(this)[0].outerHTML.replace(/</g,'').replace(/>/g,'').replace(/\//g,'').replace(/"/g,'').replace(/parent-ctrl.*/g,'').replace(/-([a-z])/g,function(m,w){return w.toUpperCase()})+'" style="display:block;height:auto;color:black;">Hover for id</a>')})})})();
```

## Hello World Code

- https://github.com/uleodolter/primo-explore-hello-world-demo

### Script step3.sh

```script
#!/bin/sh

cat > primo-explore-devenv/primo-explore/custom/ACC/package.json <<EOF
{
    "name": "ACC",
    "version": "0.0.1",
    "description": "primo-explore ACC view demo",
    "author": "Ulrich Leodolter <ulrich.leodolter@obvsg.at> (https://www.obvsg.at/)",
    "license": "ISC",
    "devDependencies": {
        "primo-explore-hello-world-demo": "0.0.1"
    }
}
EOF

cd primo-explore-devenv/primo-explore/custom/ACC && npm install
cd -
```

### ACC/js/custom.js after step3.sh and gulp run

```javascript
(function(){
"use strict";
'use strict';

/*
 * load custom view
 */
var app = angular.module('viewCustom', ['angularLoad']);

app.component('prmLogoAfter', {
  bindings: {},
  template: '<div class="hello-world"><span>Hello World</span></div>'
});
})();
```

# Links below Thumbnail, a Simple Controller

## Thumbnail Links Demo Code

- https://github.com/uleodolter/primo-explore-thumbnail-links-demo

## Script step4.sh

```script
#!/bin/sh

cat > primo-explore-devenv/primo-explore/custom/ACC/package.json <<EOF
{
    "name": "ACC",
    "version": "0.0.1",
    "description": "primo-explore ACC view demo",
    "author": "Ulrich Leodolter <ulrich.leodolter@obvsg.at> (https://www.obvsg.at/)",
    "license": "ISC",
    "devDependencies": {
        "primo-explore-hello-world-demo": "0.0.1",
        "primo-explore-thumbnail-links-demo": "0.0.2"
    }
}
EOF

cd primo-explore-devenv/primo-explore/custom/ACC && npm install
cd -
```
