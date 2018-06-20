//懒加载图片
$(function() {
    $("img.lazy").lazyload(function(){
    	 threshold : 200;
    });
});
//手机号
var un=$.cookie('username');
//密码
var pd=$.cookie('password');

$(function(){
	$('#head_login').html(un);
})
//二维码
$(function(){
	var qr=$('.qr');
	var app=$('.qr .head_app');
	qr.hover(function(){
		app.show();
	},function(){
		app.hide();
	});

})

//购物车
$(function(){
	var buycar=$('#buycar');
	var bag=$('.nullbuycar');

	buycar.hover(function(){
		bag.show();
	},function(){
		bag.hide();
	})
})

//搜索列表
$(function(){
	var search=$('.input_search');
	var detail=$('#head_search_detail');
	search.focus(function(){
		detail.fadeIn();
	});
	search.blur(function(){
		detail.fadeOut();
	})
})

//导航
$(function(){
	var navli=$('#head_nav li');
	var nav_detail=$('.head_nav_detail');
	var detail=$(".head_nav_detail .hn_detail");
	navli.each(function(){
		var index=$(this).index();
		$(this).hover(function(){
			$(this).find('i').show();
			detail.eq(index).addClass("showtime").siblings().removeClass("showtime");

		},function(){
			$(this).find('i').hide();
			detail.eq(index).removeClass("showtime");
		});

		detail.hover(function(){
			$(this).show();
		},function(){
			$(this).hide();
		})

	})
})


//商品信息渲染页面
$(function(){
	if($.cookie('product')){
//		console.log(JSON.parse($.cookie('product')));
		//	$.cookie('product');
		var b=JSON.parse($.cookie('product'));
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

   	}
})
