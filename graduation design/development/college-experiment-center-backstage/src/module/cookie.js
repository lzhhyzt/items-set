/*
 * @Description: cookie的基本操作封装(精简版)
 * @Author: lizh
 * @Date: 2018-02-02 16:35:15
 * @Last Modified by: lizh
 * @Last Modified time: 2018-02-02 16:38:11
 */

 var cookies = {
  set: function (name, value, days) {
      var d = new Date;
      d.setTime(d.getTime() + 24*60*60*1000*days);
      window.document.cookie = name + "=" + value + ";path=/;expires=" + d.toGMTString();
  },

  get: function (name) {
      var v = window.document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
      return v ? v[2] : null;
  },

  delete: function (name) {
      this.set(name, '', -1);
  }
}

export default cookies
