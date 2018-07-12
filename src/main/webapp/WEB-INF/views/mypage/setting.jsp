<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <!DOCTYPE html>
            <html>

            <head>
                <title>LIPMAN</title>
                <%@ include file="/WEB-INF/views/include/header.jsp"%>
                <%@ include file="/WEB-INF/views/mypage/profile.jsp"%>
                
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

                    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
                    <link href="/resources/css/mypage.css" rel="stylesheet">
            </head>

            <body>



                <script>

                    $(document).ready(function () {
                        
                        var genreStr = "${userVO.genre}";
                    	var genreArr = genreStr.split(',');
                    	var genreLen = genreArr.length;
                    	
                    	for(var i = 0; i <genreLen; i++){
                    		console.log("genreArr[" + i + "] = " + genreArr[i]);
							$("#genreInput"+genreArr[i]).prop( "checked", true );
                    	}
                    });

                </script>

                <!--icon-->
	<div class="mypage-profile-icon">
		<div class="mypage-profile-icon-home">
			<a href="/mypage/home">
			<img src="/resources/png/comic.png" id="profile-img-home">
			</a>
		</div>
		<div class="mypage-profile-icon-subscribe">
			<a href="/mypage/subscribed">
				<img src="/resources/png/subscribe.png" id="profile-img-subscribed">
			</a>
		</div>
		<div class="mypage-profile-icon-subscribed">
			<a href="/mypage/subscriber"> 
				<img src="/resources/png/subscribed.png" id="profile-img-subscriber">
			</a>
		</div>
		<div class="mypage-profile-icon-setting">
			<a href="/mypage/setting" class="active">
				<img src="/resources/png/setting.png" id="profile-img-setting">
			</a>
		</div>
	</div>


                <form id="registerForm" action="/user/setting" role="form" method="post">
                                           
                        <div class="mypage-setting-id">
                            <div class="mypage-setting-loginid-title">
                                Log-in ID
                            </div>
                            <div class="mypage-setting-loginid-text">
                                <span>${userVO.uid}</span>
                            </div>
                        </div>
                        
					<hr>
                        
                        <div class="mypage-setting-pw">
        					<div class="mypage-setting-password-title">
                                Password
                            </div>
                            <div class="mypage-setting-password-title-button">
                                <input type="password" name="upw" class="input-text hide" id="password-input" readonly>
                                <button type="button" id="edit-password">change</button>
                                <button type="button" id="submit-password" style="display:none;">submit</button>
                            </div>
                        </div>
                        
					<hr>
						
                        <div class="mypage-setting-nick">
                            <div class="mypage-setting-nickname-title">
                                Nick Name
                            </div>
                            <div class="mypage-setting-nickname">
        						${userVO.uname}
        					</div>
        					<div class="mypage-setting-nickname-input hide">
                                <input type="text" name="uname" class="input-text" value="${userVO.uname}" id="uname-input" readonly>
        					</div>
        
                            <div class="mypage-setting-nickname-button">
                                <input type="hidden" name="uno" value="${userVO.uno}" readonly>
                                <input type="hidden" name="uid" value="${userVO.uid}" readonly>
                                <button type="button" id="edit-uname">change</button>
                                <button type="button" id="submit-uname" style="display:none;">submit</button>


                                <script>
                                    $(function () {
                                        $('#edit-uname').click(function (e) {
                                            /* 	e.preventDefault();
                                                $('#uname').click(); */
                                                
                                            $('.mypage-setting-nickname').hide();
                                            $('.mypage-setting-nickname-input').show();
                                            $('#uname-input').removeAttr("readonly").focus();


                                            $('#edit-uname').hide();
                                            $('#submit-uname').show();
                                        });
                                    });
                                    var formObj = $("form[role='form']");
                                    console.log(formObj);

                                    $("#submit-uname, submit-profile").on("click", function () {
                                        formObj.submit();
                                    });
                                </script>
                            </div>
                        </div>
                        
					<hr>
                        
                        <div class="mypage-setting-img">
                            <div class="mypage-setting-profileimage-title">
                                <p>Profile image</p>
                            </div>
                            <div class="mypage-setting-profileimage-button">
                                <button type="button" id="edit-profile">change</button>
                                <button type="button" style="display:none;" id="submit-profile">Submit</button>

                                <input type="file" style="display:none;" id="profile">

                                <script>
                                    $(function () {
                                        $('#edit-profile').click(function (e) {
                                            e.preventDefault();
                                            $('#profile').click();

                                            $('#edit-profile').hide();
                                            $('#submit-profile').show();
                                        });
                                    });

                                    $("#submit-profile").on("click", function () {
                                        formObj.submit();
                                    });
                                </script>
                            </div>
                        </div>
                        
					<hr>
                        
                        <!-- <script>
                            $(function () {
                                $('#edit-password').click(function (e) {
                                    $('#password-input').show().removeAttr("readonly").focus();

                                    $('#edit-password').hide();
                                    $('#submit-password').show();
                                });
                            });

                            $("#submit-password").on("click", function () {
                                formObj.submit();
                            });
                        </script> -->
                                                
				       <div class="mypage-setting-subscribe">
					        <div class="mypage-setting-subscribe-title">
					            Subscribe
					        </div>
					        <p class="mypage-setting-subscribe-close">Close</p>
					        <label class="mypage-setting-subscribe-switch">
					              <input type="checkbox" checked>
					              <span class="slider round"></span>
					        </label>
					        <p class="mypage-setting-subscribe-open">Open</p>
				    	</div>
				    	
				    <hr>
				    
					    <div class="mypage-setting-subscriber">
					        <div class="mypage-setting-subscriber-title">
					            Subscriber
					        </div>
					        <p class="mypage-setting-subscriber-close">Close</p>
					        <label class="mypage-setting-subscriber-switch">
					              <input type="checkbox" checked>
					              <span class="slider round"></span>
					        </label>
					        <p class="mypage-setting-subscriber-open">Open</p>
					    </div>
					    
				    <hr>
                        
                        <div class="mypage-setting-genre">
                        <div class="mypage-setting-genre-list">
	                        <div class="mypage-setting-genre-left">
	                 			Genre
 							</div>
 							
							<div class="title-genre-checkbox mypage-setting-genre-right" >
								<div class="genre-1 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-1" value='1'>
									<span class="title-genre-1 do-not-close false">SF</span>
								</div>
								<div class="genre-2 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-2" value='2'>
									<span class="title-genre-2 do-not-close false">Mystery</span>
								</div>
								<div class="genre-3 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-3" value='3'>
									<span class="title-genre-3 do-not-close false">PureLove</span>
								</div>
								<div class="genre-4 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-4" value='4'>
									<span class="title-genre-4 do-not-close false">Romance</span>
								</div>
								<div class="genre-5 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-5" value='5'>
									<span class="title-genre-5 do-not-close false">Comic</span>
								</div>
								<div class="genre-6 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-6" value='6'>
									<span class="title-genre-6 do-not-close false">Reasoning</span>
								</div>
								<div class="genre-7 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-7" value='7'>
									<span class="title-genre-7 do-not-close false">SchoolLife</span>
								</div>
								<div class="genre-8 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-8" value='8'>
									<span class="title-genre-8 do-not-close false">Sports</span>
								</div>
								<div class="genre-9 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-9" value='9'>
									<span class="title-genre-9 do-not-close false">Fantasy</span>
								</div>
								<div class="genre-10 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-10" value='10'>
									<span class="title-genre-10 do-not-close false">Medicine</span>
								</div>
								<div class="genre-11 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-11" value='11'>
									<span class="title-genre-11 do-not-close false">Food</span>
								</div>
								<div class="genre-12 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-12" value='12'>
									<span class="title-genre-12 do-not-close false">Education</span>
								</div>
								<div class="genre-13 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-13" value='13'>
									<span class="title-genre-13 do-not-close false">Battle</span>
								</div>
								<div class="genre-14 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-14" value='14'>
									<span class="title-genre-14 do-not-close false">Mecanic</span>
								</div>
								<div class="genre-15 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-15" value='15'>
									<span class="title-genre-15 do-not-close false">Daily</span>
								</div>
								<div class="genre-16 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-16" value='16'>
									<span class="title-genre-16 do-not-close false">Age</span>
								</div>
								<div class="genre-17 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-17" value='17'>
									<span class="title-genre-17 do-not-close false">GraphicNovel</span>
								</div>
								<div class="genre-18 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-18" value='18'>
									<span class="title-genre-18 do-not-close false">Thriller</span>
								</div>
								<div class="genre-19 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-19" value='19'>
									<span class="title-genre-19 do-not-close false">Drama</span>
								</div>
								<div class="genre-20 do-not-close">
									<input type="checkbox" name='genreArr' class="do-not-close hide genre-20" value='20'>
									<span class="title-genre-20 do-not-close false">Adventure</span>
								</div>
								<p class="mypage-setting-genre-close">Close</p>
						        <label class="mypage-setting-genre-switch">
						              <input type="checkbox" checked>
						              <span class="slider round"></span>
						        </label>
						        <p class="mypage-setting-genre-open">Open</p>
							</div>
						</div>
					</div>
						
				
					 <hr>
						
						<div class="mypage-setting-logout">
					        <div class="mypage-setting-logout-button">
					            <button type="button">Log-out</button>
					        </div>
					    </div>
					    
				    <hr>
				    
					    <div class="mypage-setting-confirm">
					        <div class="mypage-setting-cancel-button">
					            <button type="button">Cancel</button>
					        </div>
					        <div class="mypage-setting-confirm-button">
					            <button type="button">Confirm</button>
					        </div>
					    </div>
								

                        


<!--                         <div class="compony"> -->
<!--                             <div class="compony-infor"> -->
<!--                                 Copyright © 2018 LIPMAN. 모든 권리 보유. -->
<!--                             </div> -->
<!--                         </div> -->

                   
                </form>
                <%-- <%@ include file="/WEB-INF/views/include/footer.html"%> --%>

                    <script type="text/javascript" src="/resources/js/upload.js"></script>
                    <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

                    <script id="template" type="text/x-handlebars-template">
			<div class="uploadedList">
				<img src="{{imgsrc}}" style="width:200px;" alt="Attachment">
			<div class="mailbox-attachment-info" style="width:200px;">
				<a href="{{getLink}}" target="_blank" class="mailbox-attachment-name">{{fileName}}</a>
				<small data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i>
				</small>
			</div>
			</div>
	</script>

                    <script>
                        function sendFile(files, editor, welEditable) {
                            formData = new FormData();
                            formData.append("file", files);
                            for (i = 0; i < files.length; i++) {
                                var file = files[i];
                                var formData = new FormData();

                                formData.append("file", file);
                                $.ajax({
                                    url: '/uploadAjax',
                                    data: formData,
                                    dataType: 'text',
                                    processData: false,
                                    contentType: false,
                                    type: 'POST',
                                    success: function (data) {
                                        var fileInfo = getFileInfo(data);
                                        var html = template(fileInfo);
                                        console.log(data);
                                        console.log(fileInfo);
                                        console.log(html);
                                        $(".uploadedList").append(html);
                                        editor.summernote('editor.insertImage', fileInfo.getLink);
                                        //editor.insertImage(welEditable, data.url);
                                    }
                                });
                            }
                        }
                        var template = Handlebars.compile($("#template").html());

                        $(".fileDrop").on("dragenter dragover", function (event) {
                            event.preventDefault();
                        });

                        $(".fileDrop").on("drop", function (event) {
                            event.preventDefault();

                            var files = event.originalEvent.dataTransfer.files;

                            for (i = 0; i < files.length; i++) {
                                var file = files[i]
                                uploadFile(file);
                            }

                        });

                        $("#profile").on("change", function (event) {

                            event.preventDefault();

                            var files = event.target.files
                            for (i = 0; i < files.length; i++) {
                                var file = event.target.files[i]
                                uploadFile(file);
                            }
                        });

                        $("#registerForm").submit(function (event) {
                            event.preventDefault();

                            var that = $(this);

                            var str = "";

                            $(".uploadedList .delbtn").each(function (index) {
                                console.log(index);
                                str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("data-src") + "'> ";
                            });
                            that.append(str);

                            that.get(0).submit();

                        });

                        $(".uploadedList").on("click", "small", function (event) {

                            var that = $(this);

                            $.ajax({
                                url: "deleteFile",
                                type: "post",
                                data: { fileName: $(this).attr("data-src") },
                                dataType: "text",
                                success: function (result) {
                                    if (result == 'deleted') {
                                        //alert("deleted");
                                        that.parents().parent("li").remove();
                                    }
                                }
                            });
                        });



                        function uploadFile(file) {
                            var formData = new FormData();

                            formData.append("file", file);
                            $.ajax({
                                url: '/uploadAjax',
                                data: formData,
                                dataType: 'text',
                                processData: false,
                                contentType: false,
                                type: 'POST',
                                success: function (data) {
                                    var fileInfo = getFileInfo(data);
                                    var html = template(fileInfo);
                                    console.log("html = " + html);
                                    $(".uploadedList").remove();
                                    $(".profile-image").append(html);
                                }
                            });
                        }

                    </script>


            </body>

            </html>