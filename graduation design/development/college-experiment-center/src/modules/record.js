/**
 * 浏览记录
 */
import Cookies from './cookie.js'
import $http from './axios.js'
import { apis } from '../config/url.js'

var scanRecord = {
  // 获取来源访问路径
  getReferrer: function () {
    var referrer = '';
    try {
        referrer = window.top.document.referrer;
    } catch(e) {
        if(window.parent) {
            try {
                referrer = window.parent.document.referrer;
            } catch(e2) {
                referrer = '';
            }
        }
    }
    if(referrer === '') {
        referrer = document.referrer;
    }
    return referrer;
  },
  // 页面加载完成执行
  record: function () {
    var second = 0;
    window.onload = function () {
      // 启动一个计时器
      window.setInterval(function () {
        second ++;
      }, 1000);

      // 把来源地址存为cookie
      Cookies.set('sourceurl', scanRecord.getReferrer(), 1)
    }

			// 用户离开页面之前执行
			window.onbeforeunload = function() {
					//用户刷新页面问题的解决
			    if(Cookies.get('sourceurl') == ''){
			        var arr = JSON.parse(localStorage.getItem("RECORDARRAY"))

			        if(arr){
			            arr[arr.length-1].time += second;
			            var jsArr= JSON.stringify(arr);
			            localStorage.setItem("RECORDARRAY", jsArr);
			        }
			    } else {
              var arr = localStorage.getItem("RECORDARRAY") ? localStorage.getItem("RECORDARRAY") : '[]';
              var uid = Cookies.get('currentuser') ? Cookies.get('currentuser') : -1;

              // 数据解析
              arr = JSON.parse(arr)
              var dataObj = {
                'url' : window.location.href,
                'time' : second,
                'refer' : scanRecord.getReferrer(),
                'timeIn' : Date.parse(new Date()) - (second * 1000),
                'timeOut' : Date.parse(new Date()),
                'uid': uid
              }
              arr.push(dataObj);
              var tjArr= JSON.stringify(arr);
              localStorage.setItem("RECORDARRAY", tjArr);

              // 存到后台数据库中
              $http.post(apis.addRecord, dataObj)
              .then(res => {
              })

              // 删除localStorage中的历史记录
              localStorage.removeItem("RECORDARRAY");
			    }
			}
  }
}

export default scanRecord
