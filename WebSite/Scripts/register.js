//懒加载图片
$(function() {
    $("img.lazy").lazyload(function(){
    	 threshold : 200;
    });
});

var ok1=false;
var ok2=false;
var ok3=false;
var ok4=false;



//手机号验证
$(function(){
	var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
	
    $('#txt').blur(function(){
    	var val=$('#txt').val();
//  	console.log(val);
    	if(val==''){
    		$('#hint').html('请输入常用手机号');
    	}else{
    		if(!(reg.test(val))){
    			$('#hint').html('请输入正确的手机号');
    		}else{
    			$('#hint').html('');
    			ok1=true;
    		}
    	}
    })
})



//图形验证码验证
$(function(){
	  var verifyCode = new GVerify("v_container");
        $('#code_input').blur(function(){
            var res = verifyCode.validate(document.getElementById("code_input").value);
            if(res){
                $('#hint').html('');
                ok2=true;
            }else{
                $('#hint').html("图形验证码错误");
            }        
        });
})


//短信验证
$(function(){
	var note_send=$('.note_send');
		$('.note_send').click(function(){
			var time=60;
			if(ok1 && ok2){
				var timer=setInterval(function(){
					time--;
					note_send.html(time+'s　重新发送');
					note_send.css('color','#666');
					if(time==1){
						clearInterval(timer);
						note_send.hide();
				        $('.note_send_hide').show();
					}
				},1000);	
			}else{
				if(!ok1){
					$('#hint').html('请输入常用手机号');
				}else{
					$('#hint').html('请填写验证码');
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
				$('#hint').html('请输入正确的密码');
			}else{
				$('#hint').html('');
				ok3=true;
			}
		}
	})
})

//再次输入密码验证
$(function(){
	var val=$('#pwd').val();
	var again=$('#pwd_again').val();
	if(again!=val){
		$('#hint').html('密码输入不一致');
	}else{
		$('#hint').html('');
		ok4=true;
	}
})

//点击注册按钮时触发的验证

$(function(){
	
	function createXHR(){
		 	if(XMLHttpRequest){		 		
		 		return new XMLHttpRequest();
		 	}		 	
		 	return new ActiveXObject('Microsoft.XMLHTTP');
		 }

	$('#btn').click(function(){
		
		if(ok1 && ok2 && ok3 && ok4){
			var xhr=createXHR();
			var url="http://127.0.0.1/ajax/mx/register.php";
//			alert(url);
			xhr.open("post",url,true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("username="+$("#txt").val()+"&password="+$("#pwd").val());
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var data=JSON.parse(xhr.responseText);
//					console.log(data);
                    if(data.success==true){
                    	alert(data.msg);
                    	$.cookie('phone',$('#txt').val());
                    	$.cookie('password',$('#pwd').val());
                        window.location.href='login.html';
                    }else{
                    	alert(data.msg);
                    }

				}
			}
            
		}else{
			alert('注册失败');
			console.log(ok1+"，"+ ok2 +"，"+ ok3 +"，"+ ok4 );
		}
	})
	
})
//$(function(){
//	var url="http://127.0.0.1/ajax/mx/register.php";
//	$.get(url,function(data){
//		var arr=data;
//		for(var i=0;i<arr.length;i++){
//			var obj=arr[i];
//			
//		}
//	})
//})
