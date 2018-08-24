// pages/coderList/coderList.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    corders: {},
    lcUser: {},
    logged: false,
    signed: false,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onShow(){
    let user = wx.getStorageSync('userInfo')
    if (user) {
      this.setData({ userInfo: user, logged: true })
    }
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/User/getUserById',
      data: {
        id: user.openId
      },
      success: res => {
        if (res.data.code == 0) {
          this.setData({
            user: res.data.data,
            lcUser: res.data.data,
            signed: true
          })
        }
      },
    })
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/Coders/getCodersByUid',
      data: {
        id: user.openId
      },
      success:res => {
        if(res.data.code == 0)
        {
          
          console.log(res.data.data)
          this.setData({
            corders: res.data.data.reverse()
          })
        }
      }
    })
  },
  viewCoder(e) {
    wx.navigateTo({
      url: '/pages/viewCoder/viewCoder?id=' + e.currentTarget.dataset.id
    })
    console.log(e.currentTarget)
  }
})