#! /bin/bash
# set -o nounset
set -o errexit

myPages=()
echo "输入添加的页面名称：(空格隔开，不加后缀，回车生成)"
read -a myPages

send=`date '+%Y-%m-%d %H:%M'`
Author=${1}
Path=${2}

cd ${Path}

for PagePath in ${myPages[@]}
do
dataPath="\"pages/${PagePath}/${PagePath}\","
sed -i '' "/pages\/log/a\\
$dataPath \\
" app.json
done
cd ..

cd ${Path}/pages



echo "
==============================================
"


for PagePath in ${myPages[@]}
do
  if [ ! -d "${PagePath}" ]; 
  then
    mkdir ${PagePath}
  fi
  echo " 😊 ${PagePath}目录创建成功"

  cd ${PagePath}
echo "/****
	* ${send} By ${1}
	* ${PagePath}.js
	*/

Page({
	data: {
	},
	onLoad: function () {
		console.log('${PagePath} Load Success');
	}
})" > ${PagePath}.js

echo "<!--${PagePath}.wxml-->" > ${PagePath}.wxml

echo "/****
	* ${send} By ${1}
	* ${PagePath}.wxss
	*/" > ${PagePath}.wxss

echo "{}" > ${PagePath}.json

cd ..

done

cd ..