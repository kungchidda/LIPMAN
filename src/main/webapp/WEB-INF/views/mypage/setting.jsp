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
			<a href="/mypage/home" class="active">
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
			<a href="/mypage/setting">
				<img src="/resources/png/setting.png" id="profile-img-setting">
			</a>
		</div>
	</div>


                <form id="registerForm" action="/user/setting" role="form" method="post">
                    <div class="container">
                        <!--setting-->
                        <!-- <div class="setting" -ms-overflow-style: none;> -->
                        <div class="setting">
                            <div class="Profile-image">
                                <p>Profile image</p>
                            </div>
                            <div class="Profile-image-button">
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
                        <div class="setting">
                            <div class="Nick-Name">
                                Nick Name
                            </div>
                            <div class="Nick-Name-button">
                                <input type="hidden" name="uno" value="${userVO.uno}" readonly>
                                <input type="hidden" name="uid" value="${userVO.uid}" readonly>
                                <input type="text" name="uname" class="input-text" value="${userVO.uname}" id="uname-input" readonly>
                                <button type="button" id="edit-uname">change</button>
                                <button type="button" id="submit-uname" style="display:none;">submit</button>


                                <script>
                                    $(function () {
                                        $('#edit-uname').click(function (e) {
                                            /* 	e.preventDefault();
                                                $('#uname').click(); */
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
                        <div class="setting">
                            <div class="Login-ID">
                                Log-in ID
                            </div>
                            <div class="Login-ID-text">
                                <span>${userVO.uid}</span>
                            </div>
                        </div>
                        <hr>
                        <div class="setting">
                            <div class="Password">
                                Password
                            </div>
                            <div class="Password-button">
                                <input type="password" name="upw" class="input-text" id="password-input" readonly>
                                <button type="button" id="edit-password">change</button>
                                <button type="button" id="submit-password" style="display:none;">submit</button>
                            </div>
                        </div>

                        <script>
                            $(function () {
                                $('#edit-password').click(function (e) {
                                    $('#password-input').removeAttr("readonly").focus();

                                    $('#edit-password').hide();
                                    $('#submit-password').show();
                                });
                            });

                            $("#submit-password").on("click", function () {
                                formObj.submit();
                            });
                        </script>
                        <hr>
                        <script>
                        	
                        </script>
                        <div class="setting">
							<input type="checkbox" name='genreArr' id="genreInput1" value='1'>SF
							<input type="checkbox" name='genreArr' id="genreInput2" value='2'>Mystery
							<input type="checkbox" name='genreArr' id="genreInput3" value='3'>PureLove
							<input type="checkbox" name='genreArr' id="genreInput4" value='4'>Romance
							<input type="checkbox" name='genreArr' id="genreInput5" value='5'>Comic
							<input type="checkbox" name='genreArr' id="genreInput6" value='6'>Reasoning
							<input type="checkbox" name='genreArr' id="genreInput7" value='7'>SchoolLife
							<input type="checkbox" name='genreArr' id="genreInput8" value='8'>Sports
							<input type="checkbox" name='genreArr' id="genreInput9" value='9'>Fantasy
							<input type="checkbox" name='genreArr' id="genreInput10" value='10'>Medical
							<input type="checkbox" name='genreArr' id="genreInput11" value='11'>Food
							<input type="checkbox" name='genreArr' id="genreInput12" value='12'>Education
							<input type="checkbox" name='genreArr' id="genreInput13" value='13'>Battle
							<input type="checkbox" name='genreArr' id="genreInput14" value='14'>Mecanic
							<input type="checkbox" name='genreArr' id="genreInput15" value='15'>Daily
							<input type="checkbox" name='genreArr' id="genreInput16" value='16'>Age
							<input type="checkbox" name='genreArr' id="genreInput17" value='17'>GraphicNovel
							<input type="checkbox" name='genreArr' id="genreInput18" value='18'>Thriller
							<input type="checkbox" name='genreArr' id="genreInput19" value='19'>Drama
							<input type="checkbox" name='genreArr' id="genreInput20" value='20'>Adventure
						</div>

                        <hr>
                        <div class="setting">
                            <div class="Password">
                                <a href="/user/logout">LOG OUT</a>
                            </div>
                        </div>
                        <hr>

                        <div class="compony">
                            <div class="compony-infor">
                                Copyright © 2018 LIPMAN. 모든 권리 보유.
                            </div>
                        </div>

                    </div>
                    <!-- /.container -->
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