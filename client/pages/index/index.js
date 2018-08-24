Page({
  data: {
    imgUrls: [
      '/images/bgp.jpg',
      '/images/colorful.jpg',
      'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg',
    ],
    indicatorDots: true,
    autoplay: true,
    interval: 2000,
    duration: 500,
    circular: true,
    indicatorColor: 'rgba(255, 255, 255, .5)',
    indicatorActiveColor: '#00a8f3',
    list:[
      {
        img: '/images/yard.jpg',
        title: '花~圃~呀~',
        author: 'Panda'
      },{
        img: '/images/626.jpg',
        title: '我的朋友史迪奇',
        author: 'Panda'
      }, {
        img: '/images/link.png',
        title: 'Panda家的路由器',
        author: 'Panda'
      }, {
        img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1534839635031&di=0db9df6895927a8a03b50c6e147904b4&imgtype=0&src=http%3A%2F%2Fpic31.photophoto.cn%2F20140524%2F0027010510139989_b.jpg',
        title: '想去....',
        author: 'Panda'
      }
    ],
    topList:[{
      img: '/images/timg.jpg',
      title: 'welcome',
      author: 'Panda',
      url: '/pages/welcome/welcome'
    },{
      img: '/images/dva.jpg',
      title: '临表涕零,不知所言',
      author: 'Chengzi',
      url: '/pages/guide/guide'
    }]
  }
})
