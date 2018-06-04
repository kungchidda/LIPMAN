<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/resources/header/header.css" />
</head>

<body class="header-body">
    <ul id="header-grid" class="header header-grid dropdown">
        <li class="brand">
            <a href="/sboard/list">LIPMAN</a>
        </li>
        <li class="icon">
<!--             <span><a href="#"  onclick='dropDownSearchBar();'><img src="/resources/header/PNG/Browser%20Icon.png"></a></span> -->
            <span><img class="dropbtn" onclick="myFunction()" src="/resources/header/PNG/Browser%20Icon.png"></span>
            <span><img src="/resources/header/PNG/Communication.png"></span>
            <span><a href="/mypage/home"><img src="/resources/header/PNG/Key.png"></a></span>
        </li>
    </ul>
        <div id="myDropdown" class="dropdown-content">
	      <!-- <a href="#" class="searchBar">Link 1</a> -->
	      <input type="text" class="searchBar" placeholder='Search Webtoons' class="searchBar">
    	</div>
    
    <!-- <script>
    function dropDownSearchBar(){
    	console.log("click dropDownSearchBar");
    	$(".header-grid").after("<div>click dropDownSearchBar</div>");
    };
    </script> -->
    <script>
    /* When the user clicks on the button, 
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown menu if the user clicks outside of it
    window.onclick = function(event) {
    	console.log("event.target.className = " + event.target.className);
    	console.log("event.target.id = " + event.target.id);
    	
    	if (!event.target.matches('.dropbtn') && !event.target.matches('.searchBar') && !event.target.matches('.dropdown-content')) {
			
			        var dropdowns = document.getElementsByClassName("dropdown-content");
			        var i;
			        for (i = 0; i < dropdowns.length; i++) {
			          var openDropdown = dropdowns[i];
			          if (openDropdown.classList.contains('show')) {
			            openDropdown.classList.remove('show');
			          }
		        	}
		  }
    }
    </script>

</body>
</html>