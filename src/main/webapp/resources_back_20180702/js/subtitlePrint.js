	
	/**************************************************************************************/
	/**************************************************************************************/
	/*                               	subtitle print 	                                  */
	/**************************************************************************************/
	/**************************************************************************************/
	
	var formObj = $("form[role='form']");

	function getSubtitle(tno){
		console.log("click getSubtitle start getPage");
		getPage("/sboard/"+tno+"/1");
		return 1;
	};	
	
	Handlebars.registerHelper("prettifyDate", function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year+"/"+month+"/"+date;
	});
	
	/* $(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		subtitlePage = $(this).attr("href");
		getPage("/subtitles/"+bno+"/5/"+subtitlePage);
		
	}); */
	
	var printData = function (subtitleArr, target, templateObject){
		console.log("start printData");
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(subtitleArr);
		
		console.log("subtitleArr = " + subtitleArr);
		target.append(html);
	}
		
		
	function getPage(pageInfo){
		console.log("start getPage pageInfo = " + "["+pageInfo+"]");
		
		$(".pagination").remove();
		$(".subtitleLi").remove();
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".og-expander"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
// 			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
			
		});
		
	}
	
	var printPaging = function(pageMaker, target){
		console.log("start printPaging");
		var str = "";
		if(pageMaker.endPage != '1'){
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class=active':'';
				str += "<li class='page-item' "+strClass+"><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
			}
		}
		target.html(str);
	}
	
	
