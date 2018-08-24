var util = require('../../utils/util.js')

Page({
  data: {
    coder: {},
    user: {},
  },

  //初始化函数
  onLoad(option) {
    //获取记录
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/Coders/getCodersById',
      data: {
        id: option.id
      },
      success: res => {
        if (res.data.code == 0) {
          this.setData({ 
            coder: res.data.data
          })
        }
        console.log(option)
        console.log(res.data.data)
      }
    })
  },

  //修改记录
  editCoder(e){
    wx.navigateTo({
      url: '/pages/editCoder/editCoder?id=' + e.currentTarget.dataset.id
    })
    console.log(e.currentTarget)
  },

  //删除记录
  deleteCoder(e){
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/Coders/deleteCoder',
      data: {
        id: e.currentTarget.dataset.id
      },
      success: res => {
        if (res.data.code == 0) {
          util.showModel('成功', res.data.data.msg)
          wx.switchTab({
            url: '/pages/coderList/coderList',
          })
          console.log(111)
          //this.onShow()
        } else {
          util.showModel('错误', '删除失败')
        }
      }
    })
  }
})