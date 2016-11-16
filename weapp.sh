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


if [ ! -d "pages" ]; then
  mkdir pages
fi

if [ ! -d "utils" ]; then
  mkdir utils
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
