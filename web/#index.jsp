<%-- 
    Document   : Login
    Created on : Nov 13, 2016, 12:30:41 PM
    Author     : Roshan Menuka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="res/homestyle.css" rel="stylesheet" type="text/css">
        <title>Login</title>
    </head>
    <body>
        <div class="slideshow-container">

            <div class="mySlides fade">
                <img src="res/1.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="res/2.jpg" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="res/3.jpg" style="width:100%">
            </div>

        </div>
        <br>

        <div style="text-align:center">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
        <div class="box">
            <div id = "img1" >
                <img src="res/User.png" width="160px">
            </div>
            <form name="login-form" action="Login_Code.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="lable">Username</td>
                            <td><input type="text" name="inusername" value="" size="50" placeholder="Enter Username" /></td>
                        </tr>
                        <tr>
                            <td class="lable">Password</td>
                            <td><input type="password" name="inpassword" value="" size="50" placeholder="Enter Password" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button type="submit">Login</button></td>
                        </tr>
                    </tbody>
                </table>

            </form>

            <div class="home">
                <p style="font-size:32px; text-align:left; margin-top:0px;">Unichem Pharmacy pvt. Ltd.</p>
                <p style="font-size:16px;text-align:left; margin-left:0px;";>No.245,<br>Main Street,<br>Badulla.<br>Contact : 055 264 4435<br>Web : <a href="#" style="text-decoration:none;">www.unichem.lk</a></p>
                <p style=""><%
                    String ip = request.getRemoteAddr();
                    if("0:0:0:0:0:0:0:1".equals(ip)){
                        out.print("You are Sitting on a Admin Computer");
                    }
                    %></p>
            </div>


        </div>
        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 4000); // Change image every 4 seconds
            }
        </script>


    </body>
</html>
