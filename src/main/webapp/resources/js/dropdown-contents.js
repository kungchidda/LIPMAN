/* When the user clicks on the button, 
                            toggle between hiding and showing the dropdown content */
        function searchFunction() {
            /* document.getElementById("searchBar").classList.toggle("search"); */
        document.getElementById("searchBar").classList.add("search");
        document.getElementById("genreBar").classList.remove("genre");
        document.getElementById("noticeBar").classList.remove("notice");
        document.getElementById("myPageBar").classList.remove("mypage");
		document.getElementById("forgotBar").classList.remove("forgot");
        document.getElementById("signupBar").classList.remove("signup");
        }

        function genreFunction() {
            /* document.getElementById("genreBar").classList.toggle("genre"); */
        document.getElementById("searchBar").classList.remove("search");
        document.getElementById("genreBar").classList.add("genre");
        document.getElementById("noticeBar").classList.remove("notice");
        document.getElementById("myPageBar").classList.remove("mypage");
		document.getElementById("forgotBar").classList.remove("forgot");
        document.getElementById("signupBar").classList.remove("signup");
        }

        function noticeFunction() {
            /* document.getElementById("noticeBar").classList.toggle("notice"); */
        document.getElementById("searchBar").classList.remove("search");
        document.getElementById("genreBar").classList.remove("genre");
        document.getElementById("noticeBar").classList.add("notice");
        document.getElementById("myPageBar").classList.remove("mypage");
		document.getElementById("forgotBar").classList.remove("forgot");
        document.getElementById("signupBar").classList.remove("signup");
        }
 
        function myPageFunction() {
            /* document.getElementById("myPageBar").classList.toggle("mypage"); */
        document.getElementById("searchBar").classList.remove("search");
        document.getElementById("genreBar").classList.remove("genre");
        document.getElementById("noticeBar").classList.remove("notice");
        document.getElementById("myPageBar").classList.add("mypage");
		document.getElementById("forgotBar").classList.remove("forgot");
        document.getElementById("signupBar").classList.remove("signup");
        }

		function forgotFunction() {
            /* document.getElementById("myPageBar").classList.toggle("mypage"); */
        document.getElementById("searchBar").classList.remove("search");
        document.getElementById("genreBar").classList.remove("genre");
        document.getElementById("noticeBar").classList.remove("notice");
        document.getElementById("myPageBar").classList.remove("mypage");
		document.getElementById("forgotBar").classList.add("forgot");
        document.getElementById("signupBar").classList.remove("signup");
        }

        function signupFunction() {
            /* document.getElementById("myPageBar").classList.toggle("mypage"); */
        document.getElementById("searchBar").classList.remove("search");
        document.getElementById("genreBar").classList.remove("genre");
        document.getElementById("noticeBar").classList.remove("notice");
        document.getElementById("myPageBar").classList.remove("mypage");
        document.getElementById("forgotBar").classList.remove("forgot");
        document.getElementById("signupBar").classList.add("signup");
        }

        // Close the dropdown menu if the user clicks outside of it
        window.onclick = function(event) {
            console.log("event.target.className = " + event.target.className);

            if (!event.target.matches('.dropbtn') && !event.target.matches('.searchBar') && !event.target.matches('.dropdown-content') && !event.target.matches('.dropdown-btn')) {

                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('search') || 
                        openDropdown.classList.contains('genre') || 
                        openDropdown.classList.contains('notice') || 
                        openDropdown.classList.contains('mypage') ||
                        openDropdown.classList.contains('forgot') ||
                        openDropdown.classList.contains('signup')) {
                        openDropdown.classList.remove('search');
                        openDropdown.classList.remove('genre');
                        openDropdown.classList.remove('notice');
                        openDropdown.classList.remove('mypage');
						openDropdown.classList.remove('forgot');
                        openDropdown.classList.remove('signup');
                    }
                }
            }
        }