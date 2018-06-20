//左侧固定
$(function(){
	$(window).scroll(function(){
		var a=$(window).scrollTop();
		if(a>210&&a<$('.main_right').height()){
			$('.main_left').css({
				position:'fixed',
				left:'32px',
				top:'0px'
			})
		}else{
			$('.main_left').css({
				position:'static'
			})
		}
	})
})


//展开缩回
$(function(){
	var tab=$('.main_tab .tab');
	var tab1=$('.tab1');
	var add=$('.jia')
	$('.main_tab').each(function(){
		var index=$(this).index();
		tab.eq(index).click(function(){
        		
				if(tab1.eq(index).css('display')=='none'){
					add.eq(index).html('-');
					tab1.eq(index).show();
				}else{
					add.eq(index).html('+');
					tab1.eq(index).hide();
	   			}
			})
	})
        	
})

//左侧筛选
$(function(){
	var bd=$('.bd');
	bd.click(function(){
		$('.saixuan').show();
		$('.new_goods').append($(this).html()+"、");
	})
	
	$('.man').click(function(){
		$('.saixuan').show();
		$('.new_goods').append($(this).html()+"、");
		
	})
	
	$('.brand_sl').click(function(){
		$('.saixuan').show();
		$('.new_goods').append($(this).html()+"、");
		
	})
	$('.c').click(function(){
		$('.saixuan').show();
		$('.new_goods').append($(this).html()+"、");
		
	})
})


//右侧筛选
$(function(){
	var bd=$('.bd');
	bd.click(function(){
		var index=$(this).index();
		console.log(index)
		$('.mr_ul').eq(index).show().siblings().hide();
	})
})

//清除条件
$(function(){
	$('#close').click(function(){
		$('.new_goods').html("");
		$('.saixuan').hide();
	})
	
	$('#delAll').click(function(){
		$('.new_goods').html("");
		$('.saixuan').hide();
	})
})

//新品
$(function(){
	$('.ul li a').click(function(){
		var index=$(this).index();
		console.log(index);
		$('.mr_xp').eq(index).show().siblings().hide();
	})
})
