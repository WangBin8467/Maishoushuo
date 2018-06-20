//懒加载图片
$(function() {
    $("img.lazy").lazyload(function(){
    	 threshold : 200;
    });
});




var username=$.cookie('phone');
var pswd=$.cookie('password');
console.log(phone+'---'+pswd);



var phone=false;
var pwd=false;

//手机号验证

$(function(){
	var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
	
    $('#txt').blur(function(){
    	var val=$('#txt').val();
//  	console.log(val);
    	if(val==''){
    		$('#hint').html('请输入用户名');
    	}else{
    		if(!(reg.test(val))){
    			$('#hint').html('用户名必须为邮箱或手机号');
    		}else{
    			$('#hint').html('');   	
    			phone=true;
    		}
    	}
    })
})

//密码验证

$(function(){
	var regpwd=/^\w{6,20}$/;
	$('#pwd').blur(function(){
		var val=$('#pwd').val();
		if(val==''){
			$('#hint').html('请输入密码');
		}else{
			if(!(regpwd.test(val))){
				$('#hint').html('用户名或密码错误');
			}else{
				$('#hint').html('');
				pwd=true;
			}
		}
	})
})

//记住密码自动登录
$(function(){
	$('.checkbox').click(function(){
		if(this.checked==true){
			$('#txt').val(username);
			$('#pwd').val(pswd);
		}else{
			$('#txt').val('');
			$('#pwd').val('');
		}
	})
})


//登录按钮
$(function(){
	$('#btn').click(function(){
		if(phone&&pwd){
			alert("登录成功！");
			$.cookie('username',$('#txt').val());
			$.cookie('password',$('#pwd').val());
			location.href='index-mx.html';
		}else{
			alert('登录失败');
//			console.log(phone+pwd)
		}
	})
})
