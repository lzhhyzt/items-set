webpackJsonp([11],{"7zKj":function(e,t,n){"use strict";var a={set:function(e,t,n){var a=new Date;a.setTime(a.getTime()+864e5*n),window.document.cookie=e+"="+t+";path=/;expires="+a.toGMTString()},get:function(e){var t=window.document.cookie.match("(^|;) ?"+e+"=([^;]*)(;|$)");return t?t[2]:null},delete:function(e){this.set(e,"",-1)}};t.a=a},"B/Kr":function(e,t,n){"use strict";var a=n("mvHQ"),i=n.n(a),o=n("7zKj"),s=n("OXJZ"),r=n("ij9N"),c={getReferrer:function(){var e="";try{e=window.top.document.referrer}catch(t){if(window.parent)try{e=window.parent.document.referrer}catch(t){e=""}}return""===e&&(e=document.referrer),e},record:function(){var e=0;window.onload=function(){window.setInterval(function(){e++},1e3),o.a.set("sourceurl",c.getReferrer(),1)},window.onbeforeunload=function(){if(""==o.a.get("sourceurl")){if(n=JSON.parse(localStorage.getItem("RECORDARRAY"))){n[n.length-1].time+=e;var t=i()(n);localStorage.setItem("RECORDARRAY",t)}}else{var n=localStorage.getItem("RECORDARRAY")?localStorage.getItem("RECORDARRAY"):"[]",a=o.a.get("currentuser")?o.a.get("currentuser"):-1;n=JSON.parse(n);var l={url:window.location.href,time:e,refer:c.getReferrer(),timeIn:Date.parse(new Date)-1e3*e,timeOut:Date.parse(new Date),uid:a};n.push(l);var u=i()(n);localStorage.setItem("RECORDARRAY",u),s.a.post(r.a.addRecord,l).then(function(e){}),localStorage.removeItem("RECORDARRAY")}}}};t.a=c},B7Vm:function(e,t,n){"use strict";t.a=function(){Date.prototype.format=function(e,t){var n={"M+":this.getMonth()+1,"d+":this.getDate(),"h+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),S:this.getMilliseconds()};/(y+)/.test(e)&&(e=e.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length)));for(var a in n)new RegExp("("+a+")").test(e)&&(e=e.replace(RegExp.$1,1===RegExp.$1.length?n[a]:("00"+n[a]).substr((""+n[a]).length)));return!0===t&&(e+="  星期"+["日","一","二","三","四","五","六"][this.getDay()]),e}}},Cz8s:function(e,t,n){"use strict";var a=n("7+uW"),i=n("Eu/k"),o=n.n(i),s=n("ij9N"),r=n("U8Tl"),c=n("mwE6"),l=n.n(c),u=(n("cU5d"),n("B7Vm")),d=n("OXJZ"),m=n("7zKj");a.default.use(l.a);var h={name:"topBar",data:function(){return{backgrounds:{background:""},time:"",themeColor:"#F28C10",weather:"",isLogin:!1}},created:function(){this.isLogined(),this.selectTheme(),this.getWeather()},methods:{isLogined:function(){null==m.a.get("FUSER")?this.isLogin=!1:this.isLogin=!0},logout:function(){d.a.get(s.a.logout).then(function(e){console.log(e),m.a.delete("FUSER"),m.a.delete("FUSERTYPE"),window.location.href="index.html"})},nowtime:function(){var e=this;Object(u.a)(),setInterval(function(){var t=(new Date).format("yyyy年MM月dd日  hh:mm:ss",!0);e.time=t},1e3)},getWeather:function(){var e=this;o.a.getJSON("http://api.map.baidu.com/telematics/v3/weather?output=json&ak=aqkG4U51pOzRLMj3pV4fmvPsq5vnn0ST&callback=?&location=广州",function(t){var n=t.results[0].weather_data[0],a=t.results[0].currentCity,i="<img src='"+n.dayPictureUrl+"' width='26' height='16'/>";e.weather=a+"&nbsp;&nbsp;"+n.weather+"&nbsp;&nbsp;"+i+"&nbsp;&nbsp;"+n.temperature})},selectTheme:function(){var e=this;d.a.post(s.a.getThemeById,{id:0}).then(function(t){var n=t.data.theme;e.backgrounds.background=n.currentColor}).catch(function(t){e.backgrounds.background=r.a.color})}}},g={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"topBar",style:this.backgrounds},[t("div",{staticClass:"topBar-banner"},[t("div",{staticClass:"topBar-hide"},[this._v(this._s(this.nowtime()))]),this._v(" "),t("div",{staticClass:"topBar-time"},[this._v(this._s(this.time))]),this._v(" "),t("div",{staticClass:"topBar-other"},[t("div",{staticClass:"topBar-login"},[t("span",{domProps:{innerHTML:this._s(this.weather)}}),this._v("\n          \n        "),0==this.isLogin?t("a",{attrs:{href:"login.html"}},[this._v("登录")]):t("span",[t("a",{attrs:{href:"pcenter.html"}},[this._v("个人中心")]),this._v("\n           \n          "),t("a",{attrs:{href:"javascript:void(0)"},on:{click:this.logout}},[this._v("注销")])])])])])])},staticRenderFns:[]};var v=n("VU/8")(h,g,!1,function(e){n("z0KN")},null,null);t.a=v.exports},JF9G:function(e,t){},OXJZ:function(e,t,n){"use strict";var a=n("mvHQ"),i=n.n(a),o=n("//Fk"),s=n.n(o),r=n("Eu/k"),c=n.n(r),l=(n("ij9N"),{post:function(e,t){var n="/apis/";if(n="/experiment_center/",null!=e)return new s.a(function(a,o){c.a.ajax({type:"POST",url:n+e,data:i()(t),cache:!0,dataType:"json",contentType:"application/json",success:function(e){a(e)}})})},get:function(e){var t="/apis/";if(t="/experiment_center/",null!=e)return new s.a(function(n,a){c.a.ajax({type:"GET",url:t+e,cache:!0,dataType:"json",contentType:"application/json",success:function(e){n(e)}})})},getCode:function(e){var t="/apis/";if(t="/experiment_center/",null!=e)return new s.a(function(n,a){c.a.ajax({type:"GET",url:t+e,data:{},success:function(e){n(e)}})})}});t.a=l},Rf9R:function(e,t){},U8Tl:function(e,t,n){"use strict";var a={color:null===sessionStorage.getItem("Theme-Color")?"#409eff":sessionStorage.getItem("Theme-Color"),navTextColor:"#015b75",qiniuDomain:"http://p4rchro8u.bkt.clouddn.com/"};t.a=a},ZWhE:function(e,t,n){e.exports=n.p+"static/img/bg.da52f3e.jpg"},ZgA2:function(e,t){},cU5d:function(e,t){},ehA2:function(e,t){},ij9N:function(e,t,n){"use strict";n.d(t,"a",function(){return a});var a={getIdentifyCode:"user/fGetIdentifyCode",login:"user/flogin",logout:"user/flogout",getFUserInfoByName:"fuser/getFUserInfoByName",getFUserDetail:"fuser/getFUserDetail",updateFUserDetails:"fuser/updateFUserDetails",updateFUserRealname:"fuser/updateFUserRealname",getNewsById:"news/getNewsById",getNewsByTitle:"news/getNewsByTitle",getNewsByAuthor:"news/getNewsByAuthor",getAllNews:"news/getAllNews",getNewsNumber:"news/newsCount",getNewsByPaging:"news/newsPagination",getPreviousOrNextNews:"news/getPreviousOrNextNews",addNews:"news/addNews",deleteNewsById:"news/removeNews",deleteMultiNews:"news/removeMultiNews",updateNewsById:"news/updateNews",getImageNews:"news/getImageNews",getAnnouncementById:"announcement/getAnnouncementById",getAnnouncementByTitle:"announcement/getAnnouncementByTitle",getAnnouncementByAuthor:"announcement/getAnnouncementByAuthor",getAllAnnouncement:"announcement/getAllAnnouncement",getAnnouncementNumber:"announcement/announcementCount",getAnnouncementByPaging:"announcement/announcementPagination",getPreviousOrNextAnnouncement:"announcement/getPreviousOrNextAnnouncement",addAnnouncement:"announcement/addAnnouncement",deleteAnnouncementById:"announcement/removeAnnouncement",deleteMultiAnnouncement:"announcement/removeMultiAnnouncement",updateAnnouncementById:"announcement/updateAnnouncement",authToken:"file/authToken",getAllFiles:"file/getAllFiles",getFileById:"file/getFileById",addFileInfo:"file/addFileInfo",getFileByName:"file/getFileByName",getFilesNumber:"file/getFilesNumber",getFilesByPaging:"file/getFilesByPaging",removeFileById:"file/removeFileById",removeMultiFiles:"file/removeMultiFiles",updateFileDownload:"file/updateFileDownload",getAllRecords:"record/getAllRecords",addRecord:"record/addRecord",getThemeById:"setting/getThemeById",getAllLaboratorys:"laboratory/getAllLaboratorys",getLaboratoryById:"laboratory/getLaboratoryById",getLaboratoryByCondition:"laboratory/getLaboratoryByCondition",getLaboratorysNumber:"laboratory/getLaboratorysNumber",getLaboratorysByPaging:"laboratory/getLaboratorysByPaging",getLabBookingInfo:"laboratory/getLabBookingInfo",updateLabBookingInfo:"laboratory/updateLabBookingInfo",getLabBookingInfoByWeek:"laboratory/getLabBookingInfoByWeek",addPerBooking:"laboratory/addPerBooking",getPerBooking:"laboratory/getPerBooking",removePerBooking:"laboratory/removePerBooking"}},mzkE:function(e,t,n){"use strict";n("7+uW");var a=n("U8Tl"),i=n("ij9N"),o=n("OXJZ"),s={name:"topBar",data:function(){return{backgrounds:{background:""},class2:""}},created:function(){this.initStyle(),this.selectTheme()},methods:{initStyle:function(){document.documentElement.scrollHeight==document.documentElement.clientHeight&&(this.class2="bottomBar2")},selectTheme:function(){var e=this;o.a.post(i.a.getThemeById,{id:0}).then(function(t){var n=t.data.theme;e.backgrounds.background=n.currentColor}).catch(function(t){e.backgrounds.background=a.a.color})}}},r={render:function(){var e=this.$createElement;return(this._self._c||e)("div",{staticClass:"bottomBar",class:this.class2,style:this.backgrounds},[this._m(0)])},staticRenderFns:[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"bottomBar-banner"},[t("div",[this._v("Copyright@ 广州大学华软软件学院 版权所有 ")]),this._v(" "),t("div",[this._v("地址：广东省广州市从化区经济开发区高技术产业园广从南路548号    邮编：510900")])])}]};var c=n("VU/8")(s,r,!1,function(e){n("ehA2")},"data-v-aa3a5f6a",null);t.a=c.exports},nVqq:function(e,t,n){"use strict";var a=n("U8Tl"),i={name:"navigationbar",data:function(){return{activeIndex:"1",color:{bgColor:"#F5F5F5",textColor:a.a.navTextColor,activeTextColor:"#ff8c00"},linkUrl:["none.html","index.html","introduce.html","news.html","announcement.html","guide.html","expteaching.html","download.html","laboratory.html","coursemanager.html"]}},mounted:function(){for(var e=window.location.pathname,t=document.querySelector(".el-menu-demo").getElementsByTagName("a"),n=t.length-1;n>=0;n--){if(t[n].href.indexOf(e)>-1){var a=t[n].getAttribute("value");this.activeIndex=a}}},methods:{handleSelect:function(e,t){return window.location.href=this.linkUrl[e],!0}}},o={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"navigationbar"},[this._m(0),this._v(" "),t("div",{staticClass:"navigationbar__nav"},[t("el-menu",{staticClass:"el-menu-demo",attrs:{"default-active":this.activeIndex,mode:"horizontal","background-color":this.color.bgColor,"text-color":this.color.textColor,"active-text-color":this.color.activeTextColor},on:{select:this.handleSelect}},[t("el-menu-item",{attrs:{index:"1"}},[t("a",{attrs:{href:this.linkUrl[1],value:"1"}},[t("img",{attrs:{src:n("yoE5")}}),this._v(" 首页")])]),this._v(" "),t("el-menu-item",{attrs:{index:"2"}},[t("a",{attrs:{href:this.linkUrl[2],value:"2"}},[this._v("中心简介")])]),this._v(" "),t("el-menu-item",{attrs:{index:"3"}},[t("a",{attrs:{href:this.linkUrl[3],value:"3"}},[this._v("新闻中心")])]),this._v(" "),t("el-menu-item",{attrs:{index:"4"}},[t("a",{attrs:{href:this.linkUrl[4],value:"4"}},[this._v("通知公告")])]),this._v(" "),t("el-menu-item",{attrs:{index:"5"}},[t("a",{attrs:{href:this.linkUrl[5],value:"5"}},[this._v("服务指南")])]),this._v(" "),t("el-menu-item",{attrs:{index:"6"}},[t("a",{attrs:{href:this.linkUrl[6],value:"6"}},[this._v("仪器设备")])]),this._v(" "),t("el-menu-item",{attrs:{index:"7"}},[t("a",{attrs:{href:this.linkUrl[7],value:"7"}},[this._v("资源下载")])]),this._v(" "),t("el-menu-item",{attrs:{index:"8"}},[t("a",{attrs:{href:this.linkUrl[8],value:"8"}},[this._v("实验室")])]),this._v(" "),t("el-menu-item",{attrs:{index:"9"}},[t("a",{attrs:{href:this.linkUrl[9],value:"9"}},[this._v("更多")])])],1)],1)])},staticRenderFns:[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"navigationbar__block"},[t("img",{attrs:{src:n("ZWhE")}})])}]};var s=n("VU/8")(i,o,!1,function(e){n("Rf9R")},null,null);t.a=s.exports},yDra:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var a=n("7+uW"),i=n("Cz8s"),o=n("mzkE"),s=n("yVqK"),r=n("nVqq"),c=n("ij9N"),l=n("OXJZ"),u=n("B7Vm"),d={name:"announcementdetail",data:function(){return{urls:{index:"index.html",announcement:"announcement.html"},announcement:{id:"",title:"",contents:"",author:"",date:"",state:-1,visits:0},previous:{},next:{},guideList:[{url:"/announcement.html",title:"通告列表"}]}},created:function(){this.urls.index="/cec/index.html",this.urls.announcement="/cec/announcement.html",this.guideList[0].url="/cec/announcement.html"},mounted:function(){Object(u.a)();var e=window.location.href,t=e.indexOf("index"),n=parseInt(e.substr(t+6));this.getAnnouncement(n),this.getPrevious(n),this.getNext(n)},methods:{getAnnouncement:function(e){var t=this;null!=e?l.a.post(c.a.getAnnouncementById,{id:e}).then(function(e){var n=e.data.announcement;t.announcement=n}):this.$message({type:"error",message:"获取内容失败"})},getPrevious:function(e){var t=this;l.a.post(c.a.getPreviousOrNextAnnouncement,{id:e,direction:0}).then(function(e){if(1==e.code){var n=e.data.announcement;t.previous=n}else t.previous.title="",t.previous.id=""})},getNext:function(e){var t=this;l.a.post(c.a.getPreviousOrNextAnnouncement,{id:e,direction:1}).then(function(e){if(1==e.code){var n=e.data.announcement;t.next=n}else t.next.title="",t.next.id=""})},increaseVisits:function(e){}}},m={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"announcementdetail"},[n("div",{staticClass:"announcementdetail-main"},[n("div",{staticClass:"announcementdetail-main-nav"},[n("span",{staticStyle:{color:"#004893"}},[e._v("当前位置：")]),e._v(" "),n("a",{attrs:{href:e.urls.index}},[e._v("首页")]),e._v(" >> "),n("a",{attrs:{href:e.urls.announcement}},[e._v("公告中心")]),e._v(" >> 详情\n      ")]),e._v(" "),n("div",{staticClass:"announcementdetail-main-content"},[n("div",{staticClass:"announcement-title"},[n("h4",[e._v(e._s(e.announcement.title))]),e._v(" "),n("h5",{staticStyle:{color:"#c0c0c0"}},[e._v(e._s(e.announcement.subtitle))])]),e._v(" "),n("div",{staticClass:"announcement-addition"},[n("span",[e._v("作者："+e._s(e.announcement.author))]),e._v("  \n          "),n("span",[e._v("发表时间："+e._s(new Date(e.announcement.date).format("yyyy-MM-dd hh:mm")))]),e._v("  \n          "),n("span",[e._v("点击数："+e._s(e.announcement.visits))])]),e._v(" "),n("div",{staticClass:"announcement-content",domProps:{innerHTML:e._s(e.announcement.contents)}}),e._v(" "),n("div",{staticClass:"announcement-navigation"},[n("p",[e._v("上一篇："),n("a",{attrs:{href:"announcementdetail.html?index="+parseInt(e.previous.id).toString()},on:{click:function(t){e.increaseVisits(e.previous.id)}}},[e._v(" "+e._s(e.previous.title)+" ")])]),e._v(" "),n("p",[e._v("下一篇："),n("a",{attrs:{href:"announcementdetail.html?index="+parseInt(e.next.id).toString()},on:{click:function(t){e.increaseVisits(e.next.id)}}},[e._v(" "+e._s(e.next.title)+" ")])])])])]),e._v(" "),n("div",{staticClass:"announcementdetail-tags"},[n("div",{staticClass:"announcementdetail-tag1"},[e._m(0),e._v(" "),n("div",{staticClass:"announcementdetail-tag1-content"},[n("ul",e._l(e.guideList,function(t){return n("li",{key:t.url},[n("i",{staticClass:"el-icon-caret-right"}),e._v(" "),n("a",{attrs:{href:t.url}},[e._v(e._s(t.title))])])}))])])])])},staticRenderFns:[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"announcementdetail-tag1-title"},[t("div",{staticClass:"tag1-title-before"}),this._v(" "),t("div",{staticClass:"tag1-title-left"},[t("span",[this._v("通告中心")])])])}]};var h=n("VU/8")(d,m,!1,function(e){n("zdXj")},"data-v-58e8f224",null).exports,g={name:"app",components:{TopBar:i.a,BottomBar:o.a,BackToTop:s.a,Navigationbar:r.a,Contains:h}},v={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{attrs:{id:"app"}},[t("top-bar"),this._v(" "),t("navigationbar"),this._v(" "),t("contains"),this._v(" "),t("bottom-bar"),this._v(" "),t("back-to-top")],1)},staticRenderFns:[]};var f=n("VU/8")(g,v,!1,function(e){n("ZgA2")},null,null).exports,p=n("B/Kr");a.default.config.productionTip=!1,new a.default({el:"#app",template:"<Detail/>",components:{Detail:f}}),p.a.record()},yVqK:function(e,t,n){"use strict";var a={name:"back-to-top",data:function(){return{isHidden:!1}},mounted:function(){window.addEventListener("scroll",this.handleScroll)},methods:{handleScroll:function(){var e=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop;this.isHidden=e>200},backToTop:function(){var e=null;window.cancelAnimationFrame(e),e=window.requestAnimationFrame(function t(){var n=document.body.scrollTop||document.documentElement.scrollTop;n>0?(document.body.scrollTop=document.documentElement.scrollTop=n-50,e=requestAnimationFrame(t)):window.cancelAnimationFrame(e)})}}},i={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{directives:[{name:"show",rawName:"v-show",value:this.isHidden,expression:"isHidden"}],staticClass:"back-to-top",on:{click:this.backToTop}},[t("div",{staticClass:"back-to-top__in"})])},staticRenderFns:[]};var o=n("VU/8")(a,i,!1,function(e){n("JF9G")},"data-v-ce549f64",null);t.a=o.exports},yoE5:function(e,t){e.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABCUlEQVQ4T82RwW3CUBBEZwzkTAeUgNKB3UE4hiBhOuBAUkTwgQ7iSAGOoQO7A5ROOAfwRP6O8cd8C6Rc8o/7d97O7BJ/fGzUh9Mu9u1P8985DBAvdq5eNyAXf3cSUF9GJPZxtw9ckEuALRZTA6B8AD0so6Du4hLwNIt/p6Yk3owBYWIgorCaT2zIOcAhLpubIBWgFGfehp6K5dWeqABCaDspANXkBaiEYNcJgHYQA1DTElIAhs8hslaK1mHbJD5FySHH9j28o4/VPK4ijGY+xcSeLBRnJNg/q+dRPiJzoUaAoHcso7CMSHB8cnETIOMA69eNET2+PNiLNcu86sBqQi3efwW4Dn9D7QevKaMRIsWJ2wAAAABJRU5ErkJggg=="},z0KN:function(e,t){},zdXj:function(e,t){}},["yDra"]);
//# sourceMappingURL=announcementdetail.3caffc86bbfed9e27bab.js.map