	
	/**************************************************************************************/
	/**************************************************************************************/
	/*                               	subtitle print 	                                  */
	/**************************************************************************************/
	/**************************************************************************************/
	
	var formObj = $("form[role='form']");

	function getSubtitle(tno, page){
		console.log("click getSubtitle start getPage");
		getPage("/sboard/"+tno+"/"+page+"/6", tno);
		return 1;
	};	
	
//	Handlebars.registerHelper("prettifyDate", function(timeValue){
//			var dateObj = new Date(timeValue);
//			var year = dateObj.getFullYear();
//			var month = dateObj.getMonth() + 1;
//			var date = dateObj.getDate();
//			return year+"/"+month+"/"+date;
//	});
	
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		
		var regdate = new Date(timeValue);
		var regdateTime = new Date(timeValue).getTime();
		regdateTime = regdateTime / 1000;
//		console.log("regdateTime = " + regdateTime);
		
		var current = new Date();
		var currentTime = new Date().getTime();
		currentTime = currentTime / 1000;
//		console.log("currentTime = " + currentTime);
		
		var diff = currentTime - regdateTime;
//		console.log("diff = " + diff);
		var year = regdate.getFullYear();
		var month = regdate.getMonth() + 1;
		var date = regdate.getDate();
		
		var prettifyDate;
		    if(diff < 60) {
		    	prettifyDate = "방금";
		    } else if(diff >= 60 && diff < 3600) {
		    	prettifyDate = Math.floor(diff/60) + "분 전";
		    } else if(diff >= 3600 && diff < 86400) {
		    	prettifyDate = Math.floor(diff/3600) + "시간 전";
		    } else if(diff >= 86400 && diff < 2419200) {
		    	prettifyDate = Math.floor(diff/86400) + "일 전";
		    } else {
		    	prettifyDate = year+"-"+month+"-"+date;
		    }
		     
		    return prettifyDate;
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
		
		
	function getPage(pageInfo, tno){
		console.log("start getPage pageInfo = " + "["+pageInfo+"]");
		
		$(".pagination").remove();
		$(".subtitleLi").remove();
		
		$.ajax({
			  type: 'GET',
			  url: pageInfo,
			  //data: data,
			  dataType : "JSON",
			  async:false,
			  success : function(data){
				  printData(data.list, $(".toggle-page"),$('#subtitle-template'));
				  printPaging(data.pageMaker, $(".pagination"), tno);
				}
			});
		
		
//		$.getJSON(pageInfo,function(data){
////			printData(data.list, $(".og-expander-inner"), $('#template'));
//			printData(data.list, $(".toggle-page"),$('#subtitle-template'));
//			printPaging(data.pageMaker, $(".pagination"), tno);
//// 			$(".subtitlecntSmall").html("[ " + data.pageMaker.totalCount +" ]");
//			
//		});
		
	}
	
	var printPaging = function(pageMaker, target, tno){
		console.log("start printPaging");
		console.log("pageMaker = " + pageMaker);
		console.log("target = " + target);
		console.log("tno = " + tno);
		var str = "";
		if(pageMaker.endPage != '1'){
			if(pageMaker.prev){
				str += //"<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>"
				'<li class="page-link do-not-close comic-list-prev" onclick="getSubtitle('+tno+','+(pageMaker.startPage-1)+');"> << </li>';
			}
			
			for(var i=pageMaker.startPage, len= pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class=active':'';
				str += '<li class="page-item do-not-close comic-list-pagi" '+strClass+'><div class="comic-list do-not-close" onclick="getSubtitle('+tno+','+i+');">'+i+'</div></li>';
			}
			
			if(pageMaker.next){
				str += //"<li><div href='/sboard/" + tno + "/" + (pageMaker.endPage+1)+"'> >> </div></li>";
					'<li class="page-link do-not-close comic-list-next" onclick="getSubtitle('+tno+','+ (pageMaker.endPage+1) +');"> >> </li>';
			}
		}
		target.html(str);
	}
	
	
