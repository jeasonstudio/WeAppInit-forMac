#! /bin/bash
# set -o nounset
set -o errexit

cd DEMO

sed -i '' 'i/],/7/' app.json

# sed G app.json
# grep -n ], app.json
# echo ${hh}
