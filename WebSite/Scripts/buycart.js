if($.cookie('product')){
	 var product=JSON.parse($.cookie("product"));
 	 console.log(product);

$(function(){
// 商品信息（cookie）
 if(product){
 	for(var i=0;i<product.length;i++){

 	 var a=$(
 	  	'<div class="pro_detail">'+
  	    	'<div class="impor">'+
 	  	  		'<input type="checkbox" class="check_pro" checked="checked" />'+
				'<div class="pro_img">'+
					'<img src="'+product[0].src+'" class="pi_img" alt="" />'+
				'</div>'+
				'<div class="pd">'+
				  	'<div class="pd_head">'+
				  		product[0].title+
				  		'<br />'+
						product[0].content+
				  	'</div>'+
				  	'<div class="pd_color">颜色：'+product[0].color+'</div>'+
			  	'</div>'+
			'</div>'+
			'<div class="pd_price">￥'+product[0].price+'</div>'+
		  	'<div class="pd_count">'+
		  		'<div class="pd_count_sum">'+
		  			'<a href="javascript:void(0)" id="jian">-</a>'+
		  			'<input type="text" class="shu" value="'+product[0].count+'" />'+
		  			'<a href="javascript:void(0)" id="add">+</a>'+
		  		'</div>'+
		  	'</div>'+
		  	'<div class="subtotal">￥<span id="subtotal">'+product[0].price*product[0].count+'</span></div>'+
		  	'<div class="delete">'+
		  	 	'<div class="haolei">'+
		  	 		'<a href="javascript:void(0)" class="add_love">加入收藏</a>'+
		  	 		'<br />'+
		  			'<a href="javascript:void(0)" class="del">删除</a>'+
		  	 	'</div>'+
		  	'</div>'+
		'</div>').appendTo('.buycar_m');
 	}
 }

 //全选
 var checkall=$('.check_all');
 checkall.click(function(){
 	if($(this).prop('checked')){
 		$('.check_pro').prop('checked',true);
 		checkall.prop('checked',true);

	}else{
 	    $('.check_pro').prop('checked',false);
 	    $(this).prop('checked',false);
 	}
 })


//数量加减
var jian=$('#jian');
var shuliang=$('.shu');
var sum=$('#subtotal');
var price=product[0].price;
//减
jian.click(function(){
	var a=parseInt(shuliang.val());
	a--;
	shuliang.val(a);
	sum.html(price*a);
})

//加
var add=$('#add');
add.click(function(){
	var a=parseInt(shuliang.val());
	a++;
	shuliang.val(a);
	sum.html(price*a);
})


//结算总额
var check=$('.check_pro');
var last_sum=$('#last_car_02_sum');
var last_count=$('.last_car_02_count');
var sum_all=0;
var sl=0;   //数量
check.each(function(){
	var index=$(this).index();
	if($(this).prop('checked')){
		sum_all+=parseFloat(sum.eq(index).html());
		sl+=parseFloat(shuliang.eq(index).val());
	}
})
 last_sum.html(sum_all);
 last_count.html(sl);



check.click(function(){
	var index=$(this).index();
	var money=sum.eq(index).html();
	var last_sum_money=last_sum.html();
	var last_count_sl=last_count.html();

	if(!$(this).prop('checked')){
		var a=parseFloat(last_sum_money)-parseFloat(money);
		var b=parseFloat(last_count_sl)-parseFloat(shuliang.eq(index).val());
		last_sum.html(a);
		last_count.html(b);
	}else{
		var a=parseFloat(last_sum_money)+parseFloat(money);
		var b=parseFloat(last_count_sl)+parseFloat(shuliang.eq(index).val());
		add.click(function(){
			a=a+parseFloat(product[0].price);
			b++;
			last_sum.html(a);
			last_count.html(b);
		});
		jian.click(function(){
			a=a-parseFloat(product[0].price);
			b--;
			last_sum.html(a);
			last_count.html(b);
		})

	}


})


  	//删除
	var del=$('.del');
	var jd=$('.pro_detail');
	$('.buycar_m').on("click",'.del',function(e){
		e.stopPropagation();
		var index=$(this).index(del);

		$('.buycar_m').find(jd).eq(index).remove();
		console.log(index);
		// $.cookie('product',null);
		product.splice(index,1);
		console.log(product);

if(product.length>0){
$.cookie("product",JSON.stringify(product),{expires:7,path:"/"});
}else{
	$.cookie('product','[]');
}

//		if($.cookie("product")==''||!$.cookie('product')){
//			$('.buycar_m').html('您的购物车已空，去别处逛逛吧');
//		}
	})


}) //$(function)

}

//猜你喜欢
$(function(){
	var ul=$('#like_ul');
	var slider=1032;
	var i=0;
	$('.like_left').click(function(){
		i--;
//		console.log(i);
		if(i<0){
			ul.css('left',-slider*3+'px');
			i=2;
		}
		//记住要空一格
        ul.animate({left:slider*-i+'px'},'slow');
	});

	$('.like_right').click(function(){
		i++;
//		console.log(i);
		if(i==4){
			i=1;
			ul.css('left','0px');
		}

		ul.animate({left:slider*-i+'px'},'slow');
	})

})
