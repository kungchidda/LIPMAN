/**************************************************************************************/
/**************************************************************************************/
/*                               subscribeBtn start                                   */
/**************************************************************************************/
/**************************************************************************************/
	
	 function subscribeBtnClick(subscribed, subscriber){
		console.log("subscribeBtn start");
		$.ajax({
			type : 'post',
			url : '/subscribes/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					subscribedList(subscribed, subscriber);
				}
			}
			});
		
	 }
	
	function unsubscribeBtnClick(subscribed, subscriber){
		console.log("unsubscribeBtn start");
		$.ajax({
			type : 'post',
			url : '/subscribes/delete',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST" },
			dataType : 'text',
			data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
			success:function(result){
				console.log("result:" + result);
				if(result=='SUCCESS'){
					subscribedList(subscribed, subscriber);
				}
			}
			});
		

			
		
	}
		

    function subscribedList(subscribed, subscriber){
				console.log("subscribedList start");
				console.log("subscribed = " + subscribed);
				console.log("subscriber = " + subscriber);
				var str = "";
				$.ajax({
					type : 'post',
					url : '/subscribes/subscribeList',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'json',
					async: false,
					data : JSON.stringify({subscribed : subscribed, subscriber : subscriber}),
					success:function(result){
						console.log("subscribeList result.length : " + result.length);
						if(result.length != 0){
							$(".subscribeBtn").hide();
							$(".unsubscribeBtn").show();
							str = " Subscribed";
						}else{
							$(".subscribeBtn").show();
							$(".unsubscribeBtn").hide();
							str = " Subscriber";
						}
					}
				});
				console.log("str = " + str);
				$.ajax({
					type : 'post',
					url : '/subscribes/count',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
					dataType : 'text',
					async: false,
					data : JSON.stringify({subscribed:subscribed}),
					success:function(result){
						var html = result + str;
						console.log("html:" + html);
						$(".subscribedCount").empty();
						$(".subscribedCount").append(html);
						
					}
					});
	}