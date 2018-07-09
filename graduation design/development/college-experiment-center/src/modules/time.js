function formaterTime () {
  Date.prototype.format = function (fmt, isweek) {
    var o = {
      'M+': this.getMonth() + 1,               // 月份
      'd+': this.getDate(),                    // 日
      'h+': this.getHours(),                   // 小时
      'm+': this.getMinutes(),                 // 分
      's+': this.getSeconds(),                 // 秒
      'q+': Math.floor((this.getMonth() + 3) / 3), // 季度
      'S': this.getMilliseconds()             // 毫秒
    }
    if (/(y+)/.test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length))
    }
    for (var k in o) {
      if (new RegExp(`(${k})`).test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
      }
    }

    // 是否要显示星期
    if(isweek === true) {
      // 遍历星期，不需要星期时可去掉这里
      var week = ['日','一','二','三','四','五','六']
      var w = week[this.getDay()];   // 星期
      fmt += '  星期' + w;
    }
    return fmt
  }
}

export default formaterTime
