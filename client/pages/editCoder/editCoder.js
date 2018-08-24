var util = require('../../utils/util.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    coder: {},
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/Coders/getCodersById',
      data: {
        id: options.id
      },
      success: res => {
        if (res.data.code == 0) {
          this.setData({ coder: res.data.data });
        }
        console.log(options)
      }
    })
  },
  //日期选择赋值方法
  bindDateChange: function (e) {
    this.setData({
      'coder.date': e.detail.value
    })
  },
  //时间输入赋值方法
  bindTimeChange: function (e) {
    this.setData({
      'coder.time': e.detail.value
    })
  },
  //标题输入赋值方法
  titleInput(e) {
    this.setData({
      'coder.title': e.detail.value
    })
  },
  //距离输入赋值方法
  distanceInput(e) {
    this.setData({
      'coder.distance': e.detail.value
    })
  },
  //燃料输入赋值方法
  fuelInput(e) {
    this.setData({
      'coder.fuel': e.detail.value
    })
  },
  //输入油费
  fuelBillInput(e) {
    this.setData({
      'coder.fuelBill': e.detail.value
    })
  },
  //输入收入
  incomeInput(e) {
    this.setData({
      'coder.income': e.detail.value
    })
  },
  //输入备注赋值方法
  bindTextAreaBlur(e) {
    this.setData({
      'coder.other': e.detail.value
    })
  },
  //修改记录
  editCoder(e) {
    util.showBusy('正在修改')
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/Coders/editCourse',
      data: this.data.coder,
      success: res => {
        if (res.data.code == 0) {

          wx.switchTab({
            url: '/pages/coderList/coderList',
          })

        } else {
          util.showModel('错误', '修改课程失败')
        }

      }
    })
  }
})