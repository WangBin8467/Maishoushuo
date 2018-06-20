function getCookie(key){
//				  xxx
//				document.write(document.cookie);   //username=zhangsan; age=60; sex=nan

		var str=decodeURIComponent(document.cookie);

		var arr=str.split('; ');   /*注意分割*/   //[username=zhangsan,age=60,sex=nan]

		for(var i=0;i<arr.length;i++){

			var arr1=arr[i].split('=');
			if(arr1[0]==key){
				return arr1[1];
			}
		}

		return false;
}


/*

 key 表示cookie的名字

 value 表示cookie的值

  expires 表示过期时间    （ms）毫秒
 * */


function setCookie(key,value,expires){

	if(arguments.length<2){

		return 'error:参数不能少于两个';
	}else{
		//参数是对的
		var str=key+'='+encodeURIComponent(value);
		if(expires){
			var d=new Date();
			d.setTime(parseInt(expires)+d.getTime());
			str+=';expires='+d;

		}

		document.cookie=str;
	}

}



//判断有没有数据
function hasData(productCookie,product){
	if(productCookie){
		for(var i=0;i<productCookie.length;i++){
			if(productCookie[i].id==product.id){
				return true;   /*cookie有数据*/
			}
		}
	}
	return false;/*cookie里面没有数据*/
}
