/**************************************************************************************/
/**************************************************************************************/
/*                               first-expander	 	                                  */
/**************************************************************************************/
/**************************************************************************************/
$(document).ready(function () {
    // first-expander 클래스를 클릭했을때
    $(".first-expander").click(function () {

        console.log("first-expander clicked");
        var submenu = $(this).find(".first-og-expander");

        if (submenu.is(":visible")) { //보이면 올림

            $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
            submenu.slideUp(300);

        } else {

            if ($(this).parents().find(".first-og-expander").is(":visible")) { //열린 곳이 있으면

                $(this).parents().find(".first-og-expander").hide(); //다른 곳은 닫음
                $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
                $(".first-expander").not(this).addClass("background-blur"); //blur 효과 주기

                submenu.show();

            } else { //열린 곳이 없으면

                $(this).parents().find(".first-og-expander").hide(); //다른 곳은 닫음
                $(this).parents().find(".background-blur").removeClass("background-blur"); //blur 효과 없애기
                $(".first-expander").not(this).addClass("background-blur"); //blur 효과 주기

                submenu.slideDown(300);
            }


        }
    });
});
