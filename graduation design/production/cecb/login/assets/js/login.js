// 判断是否已经登录了,有没有cookie
function hasCookies (name) {
	var v = window.document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    var value = v ? v[2] : null;
	if (value != null) {
		window.location.href = "/cecb/";
	} else {
		return true;
	}
}

hasCookies("CURRENTUSER");


// 回车键提交事件
$(".login-box-form").keyup(function(e){
 var e = e || event,
 keycode = e.which || e.keyCode;
 if (keycode==13) {
	login()
 }
});

//表单提交前验证
function validated (obj) {
	
	var state = true
	var pattern = /^\w{4,16}$/
	var name = obj.username.trim()
	var pwd = obj.password  //.trim()
	var captcha = obj.captcha //.trim()
	
	if (captcha == "" || captcha == null) {
		$('.login-box-error').css("display", "block")
		$('.login-box-error').text('验证码不能为空')
		state = false
		
	} else if (name == "" || pwd == "" || name == null || pwd == null) {
		$('.login-box-error').css("display", "block")
		$('.login-box-error').text('账号或者密码不能为空')
		state = false
	} else {
		if (!pattern.test(name) || !pattern.test(pwd)) {
			$('.login-box-error').css("display", "block")
			$('.login-box-error').text('账号或者密码格式错误')
			state = false
		}
	}
	return state;
}

// 表单提交
function login () {
	
	var param = {
		username: $("input[name='username']")[0].value,
    password: $("input[name='password']")[0].value,
    captcha: $("input[name='captcha']")[0].value,
	};
	
	//表单提交前验证
	if (validated(param) == false) {
		return false
	}
	
	var ajax_option={
    type: 'POST',  
    url: '/experiment_center/user/login',  
    contentType: 'application/json',
    dataType: 'json',  
    data: JSON.stringify(param),
    success: redirectPage
 };
	
	// 异步提交表单
	$.ajax(ajax_option);  
}

// 表单提交成功后重定向
function redirectPage (data) {
	console.log(data);
	
	if (data.code == 2) {
		$('.login-box-error').css("display", "block")
		$('.login-box-error').text(data.msg)
		return false 
	} else if (data.code == 1 && data.msg == "成功") {
		
		if (data.data.currentUser != null) {
  		
  		// 设置cookie
  		$.cookie('CURRENTUSER', data.data.currentUser.username, { path: '/', expires: 1 })
  		$.cookie('USERTYPE', data.data.currentUser.type, { path: '/', expires: 1 })
  		// 页面跳转
  		window.location.href = "/cecb/"
		}
	}
}

// 一开始就调用
getIdentifyCode();

// 获取验证码
function getIdentifyCode() {
	var codeUrl = '/experiment_center/user/getIdentifyCode'
	$.ajax({
		type:'GET',
		url: codeUrl,
		data: {},
		success: function (data) {
			// 加上时间防止缓存
			var url = codeUrl + "?" + new Date()
			$('#captcha_img').attr("src", url)
		}
	})
}