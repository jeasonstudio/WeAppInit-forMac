#! /bin/bash

send=`date '+%Y-%m-%d %H:%M'`
Author=${1}

# echo "$1,$2"

# while read pages
# do
#  echo $pages
#  echo "PARAB:"$parab
#  echo "PARAC:"$parac
# done < app.json

# grep -Po '"navigationBarTextStyle":".*?"'

# if cd pages
# else mkdir pages


# 创建 主文件夹
if [ ! -d " DEMO" ]; then
  mkdir DEMO
fi

cd DEMO

# 创建 app.json
echo '{
  "pages": [
    "pages/index/index",
    "pages/log/log"
  ],
  "window": {
    "navigationBarTextStyle": "",
    "navigationBarTitleText": "",
    "navigationBarBackgroundColor": "",
    "backgroundColor": ""
  },
  "networkTimeout": {
    "request": 20000,
    "connectSocket": 20000,
    "uploadFile": 20000,
    "downloadFile": 20000
  }
}' > app.json

# 创建 app.wxss
echo '/**app.wxss**/

.container {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  padding: 200rpx 0;
  box-sizing: border-box;
} ' > app.wxss

# 创建 app.js
echo "/**
  * ${send} By ${Author}
  * app.js
  */

App({
  onLaunch: function () {
    //调用API从本地缓存中获取数据
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)
  },
  getUserInfo:function(cb){
    var that = this
    if(this.globalData.userInfo){
      typeof cb == 'function' && cb(this.globalData.userInfo)
    }else{
      //调用登录接口
      wx.login({
        success: function () {
          wx.getUserInfo({
            success: function (res) {
              that.globalData.userInfo = res.userInfo
              typeof cb == 'function' && cb(that.globalData.userInfo)
            }
          })
        }
      })
    }
  },
  globalData:{
    userInfo:null
  }
})" > app.js

# 创建 utils
if [ ! -d "utils" ]; then
  mkdir utils
fi

cd utils
echo "/**
  * ${send} By ${1}
  * util.js
  */
  
function formatTime(date) {
  var year = date.getFullYear()
  var month = date.getMonth() + 1
  var day = date.getDate()

  var hour = date.getHours()
  var minute = date.getMinutes()
  var second = date.getSeconds()


  return [year, month, day].map(formatNumber).join('/') + ' ' + [hour, minute, second].map(formatNumber).join(':')
}

function formatNumber(n) {
  n = n.toString()
  return n[1] ? n : '0' + n
}

module.exports = {
  formatTime: formatTime
}" > util.js

cd ..

if [ ! -d "pages" ]; then
  mkdir pages
fi


echo "/**
  * ${send} By ${1}
  * index.js
  */

var app = getApp()
Page({
  data: {
    motto: 'Hello World',
    userInfo: {}
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onLoad: function () {
    console.log('onLoad')
    var that = this
    //调用应用实例的方法获取全局数据
    app.getUserInfo(function(userInfo){
      //更新数据
      that.setData({
        userInfo:userInfo
      })
    })
  }
})" > index.js

# 放图片文件夹
if [ ! -d "images" ]; then
  mkdir images
fi

# 放字体和 iconfonts 的文件夹
# 不建议放中文字体
if [ ! -d "fonts" ]; then
  mkdir fonts
fi
