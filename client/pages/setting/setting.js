var util = require('../../utils/util.js')
var qcloud = require('../../vendor/wafer2-client-sdk/index')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {},
    user: {},
    logged: false,
    signed: false,
  },

  onLoad: function (options) {
    let user = wx.getStorageSync('userInfo')
    if (user) {
      this.setData({ userInfo: user, logged: true })
      console.log(user)
      console.log(111)
    }
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/User/getUserById',
      data: {
        id: user.openId
      },
      success: res => {
        if (res.data.code == 0) {
          console.log(res.data.code)
          console.log(res.data.data)
          this.setData({ 
            user: res.data.data,
            signed:true 
          })
        }
      }
    })
  },

  bindNameInput(e){
    this.setData({
      ncName: e.detail.value
    })
  },
  bindSexInput(e) {
    this.setData({
      sex: e.detail.value
    })
  },
  addUser(e){
    if (!this.data.ncName) { util.showModel('错误', '请设置昵称'); return false }
    if (!this.data.sex) { util.showModel('错误', '请输入性别'); return false }
    var data = {
      openId: this.data.userInfo.openId,
      ncName: this.data.ncName,
      sex: this.data.sex,
      img: this.data.userInfo.avatarUrl,
    }
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/User/addUser',
      data: data,
      success: res => {
        if (res.data.code == 0) {
          this.setData({ 
            signed: true
          })
        }
      }
    })
  }
  
})