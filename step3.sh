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
