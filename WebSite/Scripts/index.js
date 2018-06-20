//焦点轮播图
$(function(){
	var slider=$('#slider');
	var uli=$('#slider li');
	
	var liwidth=uli[0].offsetWidth;
    var size=uli.size();  
    slider.css('width',liwidth*size);
//  console.log(slider[0].offsetWidth);
    var i=0;
    var timer=setInterval(function(){
    	i++;
    	move();
    },2000);
    
    function move(){
//  	console.log(i);
    	if(i==size){    	
    		i=1;
    		slider.css('left','0px');	
    	}
    	if(i<0){
    		slider.css('left',-liwidth*(size-1));
    		i=size-2;
    	}
    	slider.stop().animate({'left':liwidth*(-i)},500);
    }
    
    var left=$('#left');
    var right=$('#right');
    $('.slider').hover(function(){
    	clearInterval(timer);
    	left.fadeIn();
    	right.fadeIn();
    },function(){
    	left.fadeOut();
    	right.fadeOut();
    	timer=setInterval(function(){
    		i++;
    		move();
    	},2000);
    });
    
    left.click(function(){
    	i--;
        move();
    });
    right.click(function(){
    	i++;
    	move();
    })
    
})



//第二个轮播图
$(function(){
	var scroll_pro=$('#scroll_pro');
	var proli=$('#scroll_pro li');
	
	var liwidth=200;
    var size=proli.size();  
    scroll_pro.css('width',liwidth*size);
//  console.log(scroll_pro[0].offsetWidth);
    var i=0;
    var timer=setInterval(function(){
    	i++;
    	move();
    },5000);
    
     function move(){
//  	console.log(i);
    	if(i==size){    	
    		i=1;
    		scroll_pro.css('left','0px');	
    	}
    	if(i<0){
    		scroll_pro.css('left',-liwidth*(size-1));
    		i=size-2;
    	}
    	scroll_pro.stop().animate({'left':liwidth*(-i)},1000);
    }
    
    var left=$('#pre');
    var right=$('#next');  
    
    left.click(function(){
    	i--;
        move();
    });
    right.click(function(){
    	i++;
    	move();
    })
})
