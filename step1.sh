#!/bin/sh

git clone https://github.com/ExLibrisGroup/primo-explore-devenv.git
git clone https://github.com/ExLibrisGroup/primo-explore-package.git

sed -i 's/your-server:your-port/search.obvsg.at:80/' primo-explore-devenv/gulp/config.js

cp -av primo-explore-package/VIEW_CODE primo-explore-devenv/primo-explore/custom/ACC

cd primo-explore-devenv && npm install

