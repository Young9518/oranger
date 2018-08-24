var util = require('../../utils/util.js')
var qcloud = require('../../vendor/wafer2-client-sdk/index')

Page({
  data: {
    userInfo: {},
    user: {},
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    logged: false,
    user: false,
    interList:[{
      img:'/images/moon.png',
      title:'使用指南',
      url:'/pages/welcome/welcome'
    }]
  },

  onShow() {
    
    //获取localstorage用户信息
    let user = wx.getStorageSync('userInfo')
    //判断赋值
    if (user) {
      this.setData({ userInfo: user, logged: true })
      wx.request({
        url: 'https://nxhlnolc.qcloud.la/weapp/User/getUserById',
        data: {
          id: user.openId
        },
        success: res => {
          if (res.data.code == 0) {
            this.setData({
              user: res.data.data,
              signed: true
            })
          }
        }
      })
    }
  },

  //点击获取用户信息
  bindGetUserInfo() {
    //使用qclode登陆接口  /controllers/login
    qcloud.login({
      success: res => {
        wx.setStorageSync('userInfo', res)
        util.showSuccess('登录成功')
        this.setData({ userInfo: res, logged: true })
      },
      fail: err => {
        console.error(err)
        util.showModel('登录错误', err.message)
      }
    })
  }
})