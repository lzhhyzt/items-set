webpackJsonp([13],{"7zKj":function(e,t,n){"use strict";var o={set:function(e,t,n){var o=new Date;o.setTime(o.getTime()+864e5*n),window.document.cookie=e+"="+t+";path=/;expires="+o.toGMTString()},get:function(e){var t=window.document.cookie.match("(^|;) ?"+e+"=([^;]*)(;|$)");return t?t[2]:null},delete:function(e){this.set(e,"",-1)}};t.a=o},D6Tb:function(e,t){e.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAJlSURBVHjanJJNbIxRGIWf986d75tOtVNt/USJBEGijW5VLFobkiYiEhYkiCCR+ImytrCUilhJWLC1YsFKghBC63+Bqgrqp9Xf6bTfdOa797WYKhoScZKTk9zkPTnvPa+419fBlqG9HQv9yLt+wsoCYkiODrG3WbmQeUzoA/4GowpanMC9vn5Mh3r2451gEgA4UQABKoDKKa0AMkAIYJjfgM/1rfMf7h7Wnptn/curN4iGl2ECFhTTgKaB+8D7GdwDYGSsD//g3AkQsCGa7W3xjy4+1ZGutl0DSxIZl9YYrQKqgNlT/JnAP7m0Tz93rpdkCgAxFuKonDhqZtY8VQRQ94f1tfQH+eEREuEArlh69Q7CyqysOXrkbvWYz5pxsRjzBwMBMCZTdzm5snWd1Cy/oq4IhQnMitbz1DV235LnIB4gmsFJwAHYOFVNtGjuq3TN8s2p93cOxINd2+3SlvbBGCbSs0HjSJG1gsqv7QFjDo/0OqUbGMwOsrTvGYvHP/F2yUbeldVSY/Ic10M80g5C0r/lj4mpogJ5UfR0Fn3jQ2caEkbUgDrvTTV+aJW113JMcJKDfJDHBJQDyiR5AizX7Fm4mndsHS608yVS+7VEvkZa15/v2jk6ye5RZUe2n5poC+TrId/A6slt3HPPUK/YBBAI+YRAmfyIBykhFwCOAmmdQ3PxDB+Tp2hLbmCTtBBIiGqM5R8QUyDQBZyO22ny8VQJEQLWKuAh6X70MqUeQl9SALzGPEkGNIUWSE172xDICF3zjNwuE9WSgUitkTcZkWnTUIT63DfI5lCm78qKlmb+G98HAFJgFY3dljfhAAAAAElFTkSuQmCC"},OXJZ:function(e,t,n){"use strict";var o=n("mvHQ"),a=n.n(o),s=n("//Fk"),i=n.n(s),r=n("Eu/k"),l=n.n(r),u=(n("ij9N"),{post:function(e,t){var n="/apis/";if(n="/experiment_center/",null!=e)return new i.a(function(o,s){l.a.ajax({type:"POST",url:n+e,data:a()(t),cache:!0,dataType:"json",contentType:"application/json",success:function(e){o(e)}})})},get:function(e){var t="/apis/";if(t="/experiment_center/",null!=e)return new i.a(function(n,o){l.a.ajax({type:"GET",url:t+e,cache:!0,dataType:"json",contentType:"application/json",success:function(e){n(e)}})})},getCode:function(e){var t="/apis/";if(t="/experiment_center/",null!=e)return new i.a(function(n,o){l.a.ajax({type:"GET",url:t+e,data:{},success:function(e){n(e)}})})}});t.a=u},ij9N:function(e,t,n){"use strict";n.d(t,"a",function(){return o});var o={getIdentifyCode:"user/fGetIdentifyCode",login:"user/flogin",logout:"user/flogout",getFUserInfoByName:"fuser/getFUserInfoByName",getFUserDetail:"fuser/getFUserDetail",updateFUserDetails:"fuser/updateFUserDetails",updateFUserRealname:"fuser/updateFUserRealname",getNewsById:"news/getNewsById",getNewsByTitle:"news/getNewsByTitle",getNewsByAuthor:"news/getNewsByAuthor",getAllNews:"news/getAllNews",getNewsNumber:"news/newsCount",getNewsByPaging:"news/newsPagination",getPreviousOrNextNews:"news/getPreviousOrNextNews",addNews:"news/addNews",deleteNewsById:"news/removeNews",deleteMultiNews:"news/removeMultiNews",updateNewsById:"news/updateNews",getImageNews:"news/getImageNews",getAnnouncementById:"announcement/getAnnouncementById",getAnnouncementByTitle:"announcement/getAnnouncementByTitle",getAnnouncementByAuthor:"announcement/getAnnouncementByAuthor",getAllAnnouncement:"announcement/getAllAnnouncement",getAnnouncementNumber:"announcement/announcementCount",getAnnouncementByPaging:"announcement/announcementPagination",getPreviousOrNextAnnouncement:"announcement/getPreviousOrNextAnnouncement",addAnnouncement:"announcement/addAnnouncement",deleteAnnouncementById:"announcement/removeAnnouncement",deleteMultiAnnouncement:"announcement/removeMultiAnnouncement",updateAnnouncementById:"announcement/updateAnnouncement",authToken:"file/authToken",getAllFiles:"file/getAllFiles",getFileById:"file/getFileById",addFileInfo:"file/addFileInfo",getFileByName:"file/getFileByName",getFilesNumber:"file/getFilesNumber",getFilesByPaging:"file/getFilesByPaging",removeFileById:"file/removeFileById",removeMultiFiles:"file/removeMultiFiles",updateFileDownload:"file/updateFileDownload",getAllRecords:"record/getAllRecords",addRecord:"record/addRecord",getThemeById:"setting/getThemeById",getAllLaboratorys:"laboratory/getAllLaboratorys",getLaboratoryById:"laboratory/getLaboratoryById",getLaboratoryByCondition:"laboratory/getLaboratoryByCondition",getLaboratorysNumber:"laboratory/getLaboratorysNumber",getLaboratorysByPaging:"laboratory/getLaboratorysByPaging",getLabBookingInfo:"laboratory/getLabBookingInfo",updateLabBookingInfo:"laboratory/updateLabBookingInfo",getLabBookingInfoByWeek:"laboratory/getLabBookingInfoByWeek",addPerBooking:"laboratory/addPerBooking",getPerBooking:"laboratory/getPerBooking",removePerBooking:"laboratory/removePerBooking"}},mTzT:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var o=n("7+uW"),a=n("ij9N"),s=n("OXJZ"),i=n("7zKj"),r={name:"login",data:function(){return{sid:"",password:"",captchaUrl:"",showState:!1,showTip:""}},created:function(){},methods:{validated:function(){var e=!0,t=/^\w{4,16}$/,n=this.sid.trim(),o=this.password.trim();return""==n||""==o||null==n||null==o?(this.showState=!0,this.showTip="账号密码不能为空",e=!1):t.test(n)&&t.test(o)||(this.showState=!0,this.showTip="账号密码格式错误",e=!1),e},login:function(){var e=this,t={username:this.sid,password:this.password};if(0==this.validated())return!1;s.a.post(a.a.login,t).then(function(t){console.log(t),e.redirectPage(t)})},redirectPage:function(e){if(console.log("data",e),2==e.code)return this.showState=!0,this.showTip=e.msg,!1;1==e.code&&"成功"==e.msg&&null!=e.data.currentUser&&(i.a.set("FUSER",e.data.currentUser.username),i.a.set("FUSERTYPE",e.data.currentUser.type),window.location.href="/cec/index.html")}}},l={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"login"},[e._m(0),e._v(" "),n("div",{staticClass:"login-box"},[n("div",{staticClass:"login-box-title"},[n("div",{directives:[{name:"show",rawName:"v-show",value:e.showState,expression:"showState"}],staticClass:"login-box-error"},[e._v(e._s(e.showTip))]),e._v(" "),n("p",[e._v("欢迎您，用户")])]),e._v(" "),n("form",{staticClass:"login-box-form",attrs:{method:"post",action:"#",onsubmit:"return false"}},[n("div",{attrs:{clas:"box-form-account"}},[n("div",{staticClass:"account-icon fl"}),e._v(" "),n("input",{directives:[{name:"model",rawName:"v-model",value:e.sid,expression:"sid"}],staticClass:"form-account fl",attrs:{type:"text",name:"username",placeholder:"用户编号",value:""},domProps:{value:e.sid},on:{input:function(t){t.target.composing||(e.sid=t.target.value)}}})]),e._v(" "),n("div",{staticClass:"box-form-password"},[n("div",{staticClass:"password-icon fl"}),e._v(" "),n("input",{directives:[{name:"model",rawName:"v-model",value:e.password,expression:"password"}],staticClass:"form-password fl",attrs:{type:"password",name:"password",placeholder:"密码"},domProps:{value:e.password},on:{input:function(t){t.target.composing||(e.password=t.target.value)}}})]),e._v(" "),n("input",{staticClass:"form-submit",attrs:{type:"button",value:"登录"},on:{click:function(t){e.login()}}})])])])},staticRenderFns:[function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"login-title"},[t("img",{attrs:{src:n("D6Tb"),width:"20",height:"20"}}),this._v("\n \t\t实验中心用户登录\n \t")])}]};var u=n("VU/8")(r,l,!1,function(e){n("w3RB")},null,null).exports;o.default.config.productionTip=!1,new o.default({el:"#app",template:"<Login/>",components:{Login:u}})},w3RB:function(e,t){}},["mTzT"]);
//# sourceMappingURL=login.bd01f53574c4ff88a544.js.map