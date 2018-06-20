//图片懒加载
$(function() {
    $("img.lazy").lazyload();
});

//上一张图,
$(function(){
	var ul=$('#pro_small_img');
	$('.top').click(function(){
		var i=0;
		var y=ul.css('top');
		if(parseInt(y)<=-67){
			i++;
			var top=parseInt(y)+67*i+'px';
			console.log(top);
			ul.css({top:top});
		}
	})
})

//下一张图
$(function(){
	var ul=$('#pro_small_img');
	var i=0;
	$('.bottom').click(function(){
		i++;
		if(i==3){
			i=0;
		}

		var y=ul.css('top');
		if(parseInt(y)>=-67&&i<=2){
			var top=-67*i+'px';
			ul.css({top:top});
		}
	})
})


//放大镜
$(function(){
	var smallbox=$('.slider_box');
	var middlebox=$('.pro_left_box');
	var bigbox=$('.pro_hide');

	var scale=800/384;
	middlebox.mouseenter(function(){
		smallbox.show();
		bigbox.show();
	})

	middlebox.mouseleave(function(){
		smallbox.hide();
		bigbox.hide();
	})

	middlebox.mousemove(function(e){
		var e=e||event;
		var x=e.pageX-$(this).offset().left-smallbox.width()/2;
		var y=e.pageY-$(this).offset().top-smallbox.height()/2;
//		console.log(x,y);
		if(x<0){
			x=0;
			}else if(x>middlebox.width()-smallbox.width()){
				x=middlebox.width()-smallbox.width();
			}

			if(y<0){
				y=0;
			}else if(y>middlebox.height()-smallbox.height()){
				y=middlebox.height()-smallbox.height();
			}


		smallbox.css({
			left:x,
		    top:y
		});

		$('.big_img').css({
			left:-x*scale,
			top:-y*scale
		});
	})

	$('#pro_small_img li').each(function(){
		var index=$(this).index();
//		console.log(index);
		$(this).hover(function(){
			$('#pro_small_img li').eq(index).addClass('pro_border').siblings().removeClass('pro_border');
			$('#pro_middle_img li').eq(index).addClass('li_hide').siblings().removeClass('li_hide');
			$('.big_img').eq(index).show().siblings().hide();
		})
	})

})

//分享
$(function(){
	$('.pro_share').hover(function(){
		$('.pro_share_hide').fadeIn();
	},function(){
		$('.pro_share_hide').fadeOut();
	})
})

//相关推荐
$(function(){
	var ul=$('#recommend_about');
	var slider=1032;
	var i=0;

	$('.left').click(function(){
		i--;
//		console.log(i);
		if(i<0){
			ul.css('left',-slider*3+'px');
			i=2;
		}
		//记住要空一格
        ul.animate({left:slider*-i+'px'},'slow');
	});

	$('.right').click(function(){
		i++;
//		console.log(i);
		if(i==4){
			i=1;
			ul.css('left','0px');
		}

		ul.animate({left:slider*-i+'px'},'slow');
	})

})

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

//滚动条
$(function(){
	$(window).scroll(function(){
		var s=$(window).scrollTop();
//		console.log(s);
		if(s>1300){
			$('.btn_detail').css({
				position:'fixed',
				top:'0px',
				left:'30px'	,
				marginTop:'0px',
				borderBottom:'1px solid #ccc'
			});
			$('.pro_btn').show();
		}else{
			$('.btn_detail').css({
				position:'static',
				marginTop:'20px',
				borderBottom:'0'
			})
			$('.pro_btn').hide();
		}
	});
})


//tab切换
$(function(){
	var a=$('.btn_detail a');
	var tab=$('.tab_over>div');
	a.each(function(){
		var index=$(this).index();
		$(this).click(function(){
			$(this).addClass('bac_color').siblings().removeClass('bac_color');
			tab.eq(index).show().siblings().hide();
		})
	})
})


//加入购物车
$(function(){
	$('#add_buycar').click(function(){
		var price=$('#price').html();
//		console.log(price);
		var product={
			id:0,
			src:$('#img_no1')[0].src,
			title:$('#title').html(),
			content:$('#content').html(),
			color:$('#color').html(),
			price:price,
			count:1
		}
        var arr=[];
		arr.push(product);
        console.log(arr);
		var savePro;
		var productCookie=getCookie('product');//数据写入cookie
        console.log(productCookie);
// 判断一下
		if(productCookie){
            productCookie=JSON.parse(productCookie);
			if(hasData(productCookie,product)){
				for(var j=0;j<productCookie.length;j++){
					productCookie[j].count+=1;
				}
				savePro=productCookie;
			}else{
			 	savePro=productCookie.concat(arr);
		    }


		}else{
            savePro=arr;
            console.log(savePro);
		}

//		setCookie('product',JSON.stringify(savePro),7*24*3600*1000);
		console.log(savePro);
        console.log(JSON.stringify(savePro));
        let i = JSON.stringify(savePro);
		$.cookie("product",i);
		console.log($.cookie('product'));



	//渲染页面

	var b=JSON.parse($.cookie("product"));
//	console.log(b[0].count);
if(b.length>0){
     $('#hic4').html(b[0].count);

     $('.bag').html(
           '<h4>我的商品</h4>'+
           '<div class="new_buy">'+
           '<img src="'+b[0].src+'" class="dt_img" />'+
           '<div class="new_buy_content">'+
           '<h5>'+b[0].title+'</h5>'+
           '<p>'+b[0].content+'</p>'+
           '<div class="price_count">￥'+b[0].price+'<span>x'+b[0].count+'</span></div>'+
           '</div></div>'+
           '<div class="dt_sum">商品合计：￥'+'<span>'+b[0].price*b[0].count+'</span>'+
           '<a href="buycart.html" id="to_count">'+'去结算</a>'+'</div>'
       )
}
	})
})

//$(function(){
//	var count=0;
//	$('#add_buycar').click(function(){
//		var arr=$.cookie("product")?JSON.parse($.cookie("product")):[];
//		for(var j=0;j<arr.length;j++){
//				if(arr[j].id==parseInt()){
//
//					arr[j].sum+=sum;
//					break;
//				}
//			}
//})




//渲染页面
$(function(){
		//	$.cookie('product');
    console.log($.cookie("product"));
	var b=JSON.parse($.cookie("product"));
//	console.log(b[0].count);
    if(b.length>0){
     $('#hic4').html(b[0].count);
     $('.bag').html(
           '<h4>我的商品</h4>'+
           '<div class="new_buy">'+
           '<img src="'+b[0].src+'" class="dt_img" />'+
           '<div class="new_buy_content">'+
           '<h5>'+b[0].title+'</h5>'+
           '<p>'+b[0].content+'</p>'+
           '<div class="price_count">￥'+b[0].price+'<span>x'+b[0].count+'</span></div>'+
           '</div></div>'+
           '<div class="dt_sum">商品合计：￥'+'<span>'+b[0].price*b[0].count+'</span>'+
           '<a href="buycart.html" id="to_count">'+'去结算</a>'+'</div>'
       )
}

})
