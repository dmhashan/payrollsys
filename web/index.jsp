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
        <link href="res/popup.css" rel="stylesheet" type="text/css">
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
            <form  name="login-form" action="Login_Code.jsp" method="POST" style="margin-top: -160px;margin-left:220px;align-items: center;font-family: 'RobotoDraft', 'Roboto', sans-serif;color:#ffffff;font-weight: bold;">
                <table border="0">
                    <tbody>
                        <tr>
                            <td class="lable"style="font-size: 16px;">Username</td>
                            <td><input class="input" type="text" name="inusername" value="" size="50" placeholder="Enter Username" style="width: 250px; height:45px;padding: 12px 20px;margin: 8px 0;margin-left: 12px;font-size:15px;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"/></td>
                        </tr>
                        <tr>
                            <td class="lable" style="font-size: 16px;">Password</td>
                            <td><input class="input" type="password" name="inpassword" value="" size="50" placeholder="Enter Password" style="    width: 250px; height:45px;padding: 12px 20px;margin: 8px 0;margin-left: 12px;font-size:15px;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button type="submit" style=" background-color: #2b44ff;
    font-size: 16px;
    font-weight: bold;
    color: white;
    padding: 0px 20px;
    margin-left: 135px;
    border: none;
    cursor: pointer;
    width: 125px;
    height: 40px;">Login</button></td>
                        </tr>
                    </tbody>
                </table>

            </form>

            <div class="home">
                <p style="font-size:32px; text-align:left; margin-top:0px;">Unichem Pharmacy pvt. Ltd.</p>
                <p style="font-size:16px;text-align:left; margin-left:0px;";>No.245,<br>Main Street,<br>Badulla.<br>Contact : 055 264 4435<br>Web : <a href="#" style="text-decoration:none;">www.unichem.lk</a></p>
                <p style=""><%
                    String ip = request.getRemoteAddr();
                    if ("0:0:0:0:0:0:0:1".equals(ip)) {
                        out.print("You are Sitting on a Admin Computer");
                    }
                    %></p>
            </div>
            <div id="footer">
                <p style="font-size: 12px; text-align: center;">Copyright @ SOKIBPAN Software Solutions 2016.</p>
                </div>
            <%--ErrorPopUp--%>

            <div id="invalid" class="modalDialog">
                <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <img id= "icon" src="res/cacel.png" width="100px" style="margin-left: 0px;">
                    <br>
                    <h3 style="text-align: center; color: #ffffff;">Invalid Username or Password!</h3>

                </div>
            </div>

            <div id="logagain" class="modalDialog">
                <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <img id= "icon" src="res/cacel.png" width="100px" style="margin-left: 0px;">
                    <br>
                    <h3 style="text-align: center; color: #ffffff;">Log Again, Logging fail!</h3>

                </div>
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
