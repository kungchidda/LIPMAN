/**************************************************************************************/
/**************************************************************************************/
/*                               	expander	 	                                  */
/**************************************************************************************/
/**************************************************************************************/
$(document).ready(function () {
    // expander 클래스를 클릭했을때
	$(".expander").click(function() {
    	
        console.log("expander clicked");
        var submenu = $(this).find(".og-expander");
        var tno = $(this).attr('id');
        console.log("tno = " + tno);
        if (!event.target.matches('.do-not-close') ) {
        if (submenu.is(":visible")) { //보이면 올림
        	
            $(".background-blur").removeClass("background-blur"); //blur 효과 없애기
            submenu.slideUp(300);
            $(this).removeClass("margin-bottom");
            
        } else {
        	var getSubtitleResult = getSubtitle(tno, '1');
            if(getSubtitleResult){
				
                if ($(".og-expander").is(":visible")) { //열린 곳이 있으면
                	
//                    $(".og-expander").slideUp(300); //다른 곳은 닫음
                	$(".og-expander").hide(); //다른 곳은 닫음
                    $(".background-blur").removeClass("background-blur"); //blur 효과 없애기
                    $(".expander").not(this).addClass("background-blur"); //blur 효과 주기
                    $(".margin-bottom").removeClass("margin-bottom"); //margin 삭제
                    $(this).addClass("margin-bottom");
                    
//                    submenu.show();
                    submenu.slideDown(300);

                } else { //열린 곳이 없으면
                    
                    $(".expander").not(this).addClass("background-blur"); //blur 효과 주기
                    $(this).addClass("margin-bottom");
                    
                    submenu.slideDown(300);
                }
            }
            
  
        }
	}
    });
});
