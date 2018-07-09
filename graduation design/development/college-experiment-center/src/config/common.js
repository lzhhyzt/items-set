var config = {
  color: sessionStorage.getItem('Theme-Color') === null? '#409eff': sessionStorage.getItem('Theme-Color'),  // 总体色调，默认色调-墨绿色
  navTextColor: '#015b75',
  qiniuDomain: 'http://p4rchro8u.bkt.clouddn.com/'   // 七牛云存储空间域名
}

export default config
