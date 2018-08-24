var util = require('../../utils/util.js')

Page({
  data: {
    users: {},
    user: {},
    logged: false,
    signed: false,
  },
  //初始化函数
  onShow() {
    //获取localstorage用户信息
    let user = wx.getStorageSync('userInfo')
    //判断赋值
    if (user) {
      this.setData({ userInfo: user, logged: true })
      console.log(user)
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
              users: res.data.data,
              user: res.data.data,
              signed: true
            })
          }
        }
      })
    }
  },
  /** 
   * 
   * 未设置用户只能看见自己记录
   * 用户可以查看数据库内所有用户的记录
   * 
  
  onLoad(option) {
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/User/getUserById',
      data:{
        id: option.openId
      },
      success: res => {
        if (res.data.code == 0) {
          
          this.setData({ users: res.data.data })
        }
      }
    })
  },
  **/

  //用户选择赋值方法
  bindPickerChange(e) {
    this.setData({
      user: this.data.users[e.detail.value]
    })
    console.log(e)
  },

  //日期选择赋值方法
  bindDateChange: function (e) {
    this.setData({
      date: e.detail.value
    })
  },
//时间输入赋值方法
  bindTimeChange: function(e){
    this.setData({
      time: e.detail.value
    })
  },
 //标题输入赋值方法
  titleInput(e) {
    this.setData({
      title: e.detail.value
    })
  },
  //距离输入赋值方法
  distanceInput(e) {
    this.setData({
      distance: e.detail.value
    })
  },
  //燃料输入赋值方法
  fuelInput(e) {
    this.setData({
      fuel: e.detail.value
    })
  },
  //输入油费
  fuelBillInput(e) {
    this.setData({
      fuelBill: e.detail.value
    })
  },
  //输入收入
  incomeInput(e) {
    this.setData({
      income: e.detail.value
    })
  },
  //输入备注赋值方法
  bindTextAreaBlur(e) {
    this.setData({
      other: e.detail.value
    })
  },

  //添加
  addCoder() {
    //空值判断
    if (!this.data.user) { util.showModel('错误', '请选择司机'); return false }
    if (!this.data.date) { util.showModel('错误', '请选择日期'); return false }
    if (!this.data.time) { util.showModel('错误', '请选择时间'); return false }
    if (!this.data.title) { util.showModel('错误', '请输入标题'); return false }
    if (!this.data.distance) { util.showModel('错误', '请输入距离'); return false }
    if (!this.data.fuel) { util.showModel('错误', '请输入油耗'); return false }
    if (!this.data.fuelBill) { util.showModel('错误', '请输入油费'); return false }
    if (!this.data.income) { util.showModel('错误', '请输入收入'); return false }

    //组合课程数据
    var data = {
      userId: this.data.user.openId,
      title: this.data.title,
      other: this.data.other,
      date: this.data.date,
      time: this.data.time,
      distance: this.data.distance,
      fuel: this.data.fuel,
      fuelBill: this.data.fuelBill,
      income: this.data.income

    }
    util.showBusy('正在添加')
    wx.request({
      url: 'https://nxhlnolc.qcloud.la/weapp/Coders/addCoder',
      data: data,
      success: res =>{
        if (res.data.code == 0) {
          wx.switchTab({
            url: '/pages/coderList/coderList',
          })
        } else {
          util.showModel('错误', '新增记录失败')
        }
      }
    })
  }
})