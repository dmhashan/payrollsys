<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%-- 
        Document   : Admin_base
        Created on : Nov 14, 2016, 9:54:47 AM
        Author     : Roshan Menuka
            <link href="style_admin_home.css" rel="stylesheet" type="text/css">
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>User Home</title>
        <link href="res/userstyle.css" rel="stylesheet" type="text/css">
        <link href="res/popup.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            String sessionid = String.valueOf(session.getAttribute("sessionloginid"));
            Connection con = new DbConnector().getConnection();
            Statement stmt = con.createStatement();
            String firstname = "", lastname = "", nic = "", address = "", num = "", email = "", gender = "", male = "checked", female = " ", desid = "", depid = "", des = "", dep = "", bsalary = "";

            ResultSet rs1 = stmt.executeQuery("SELECT * FROM personaldetails WHERE ID='" + sessionid + "'");
            if (rs1.next()) {
                firstname = rs1.getString(1);
                lastname = rs1.getString(2);
                nic = rs1.getString(3);
                gender = rs1.getString(4);
                address = rs1.getString(5);
                num = rs1.getString(6);
                email = rs1.getString(7);
                desid = rs1.getString(9);
                depid = rs1.getString(10);

                if (rs1.getString(4).equals("Female")) {
                    male = " ";
                    female = "checked";
                }
            }
            ResultSet rs2 = stmt.executeQuery("SELECT * FROM designation WHERE DesID='" + desid + "'");
            if (rs2.next()) {
                des = rs2.getString(2);
                bsalary = rs2.getString(3);
            }
            ResultSet rs3 = stmt.executeQuery("SELECT DepName FROM department WHERE DepID='" + depid + "'");
            if (rs3.next()) {
                dep = rs3.getString(1);
            }
        %>
        <div class="head">
            <h1>UNICHEM PHARMACY</h1><h2>Pvt. Ltd.</h2>
            <h1 style="font-size: 25px;"><%=firstname + " " + lastname%>'s Profile</h>
        </div>

        <%--Starting Main Menu--%>
        <ul>
            <%--Here Starting My Profile --%>
            <li><a href="#">My Profile</a>

                <ul>
                    <%--Here Starting View Profile --%>
                    <li><a href="#openModal">View my Profile</a></li>
                    <div id="openModal" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <h2>My Profile</h2>
                                <img id= "icon" src="res/emp.png" width="150px">
                                <table border="0">

                                    <tbody>
                                        <tr>
                                            <td>Employee ID</td>
                                            <td><input type="text" name="empid" value="<%=sessionid%>" size="50" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td>Full Name</td>
                                            <td><input type="text" name="password" value="<%=firstname + " " + lastname%>" size="51" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Designation</td>
                                            <td><input type="text" name="designation" value="<%=des%>" size="50" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Department</td>
                                            <td><input type="text" name="xxx" value="<%=dep%>" size="50" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Basic Salary</td>
                                            <td><input type="text" name="username" value="<%=bsalary%>" size="50" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td><input type="text" name="password" value="<%=gender%>" size="51" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>NIC</td>
                                            <td><input type="text" name="password" value="<%=nic%>" size="51" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Telephone</td>
                                            <td><input type="text" name="password" value="<%=num%>" size="51" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><input type="text" name="password" value="<%=address%>" size="51" readonly="readonly"/></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End View profile --%>

                    <%--Here Starting Edit Profile --%>
                    <li><a href="#openModal1">Edit Profile</a></li>
                    <div id="openModal1" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="User/saveprofile_1.jsp">
                                <h2>Edit Profile</h2>
                                <img id= "icon" src="res/emp.png" width="50px">
                                <table border="0">
                                    <tbody>
                                    <input type="hidden" name="iid" value="<%=sessionid%>" readonly="readonly" />
                                    <tr>
                                        <td>First Name</td>
                                        <td><input type="text" name="ifirstname" value="<%=firstname%>" size="20" /></td>
                                    </tr>
                                    <tr>
                                        <td>Last Name</td>
                                        <td><input type="text" name="ilastname" value="<%=lastname%>" size="20" /></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><input type="radio" name="igender" value="Male" <%=male%> />Male <input type="radio" name="igender" value="Female" <%=female%> />Female</td>
                                    </tr>
                                    <tr>
                                        <td>NIC No</td>
                                        <td><input type="text" name="inic" value="<%=nic%>" size="10" /></td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td><textarea name="iaddress" rows="4" cols="20">
                                                <%=address%>
                                            </textarea></td>
                                    </tr>
                                    <tr>
                                        <td>Contact Number</td>
                                        <td><input type="text" name="inumber" value="<%=num%>" size="10" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input type="text" name="iemail" value="<%=email%>" size="30" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right"><button type="submit">Save Profile</button></td>
                                    </tr>
                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Edit Profile --%>

                    <%
                        String dbun = "", dbpw = "";
                        ResultSet rs4 = stmt.executeQuery("SELECT * FROM login WHERE ID='" + sessionid + "'");
                        if (rs4.next()) {
                            dbun = rs4.getString("username");
                            dbpw = rs4.getString("password");
                        }
                    %>       
                    <%--Here Starting Edit Login --%>
                    <li><a href="#openModal2">Edit Login</a></li>
                    <div id="openModal2" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form style="margin-left: 25px;" id="add" name="modilogin" action="User/modilogin.jsp">
                                <h2>Change Username/Password</h2>
                                <img id= "icon" src="res/uprem.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>New Username</td>
                                            <td><input type="text" name="un" value="<%=dbun%>" size="50"  /></td>
                                        </tr>
                                        <tr>
                                            <td>Old Password</td>
                                            <td><input type="password" name="oldpw" value="" /><input type="hidden" name="oldpw2" value="<%=dbpw%>" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td>New Password</td>
                                            <td><input type="password" name="newpw" value="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Confirm Password</td>
                                            <td><input type="password" name="pw" value="" /></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td><button type="submit">Update</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Edit Login --%>

                </ul>
            </li>
            <%--Here End My Profile --%>




            <%--Here Starting Salary Modification List --%>
            <li><a href="#">My Salary Details</a>
                <ul>
                    <%--Start Basic Salary--%>
                    <li><a href="#openModal21">Basic Salary</a></li>
                    <div id="openModal21" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">

                                <img id= "icon" src="res/sal.png" width="100px">
                                <h2>View Basic Salary</h2>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>


                        </div>
                    </div>
                    <%--End Basic Salary--%>



                    <%--Start Convenience--%>
                    <li><a href="#openModal22">Convenience details</a></li>
                    <div id="openModal22" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">

                                <img id= "icon" src="res/sal.png" width="100px">
                                <h2>View Convenience</h2>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--End Convenience--%>

                    <%--Start Bonus--%>
                    <li><a href="#openModal23">Bonus Details</a></li>
                    <div id="openModal23" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <img id= "icon" src="res/sal.png" width="100px">
                                <h2>Bonus For Month</h2>

                                <table border="0">
                                    <tbody>

                                        <tr>
                                            <td>Month</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View Bonus</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>
                        </div>
                    </div>
                    <%--End Bonus--%>

                    <%--Start Deduction--%>
                    <li><a href="#openModal24">Deduction Details</a></li>
                    <div id="openModal24" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">

                                <img id= "icon" src="res/sal.png" width="100px">
                                <h2>Check Deductions</h2>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Month</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>

                                    <td></td>
                                    <td><button type="submit">Check</button></td>
                                    </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--End Deduction--%>



                </ul>
            </li>
            <%--Here End Salary Modification List --%>

            <%--Here Start Payroll Options --%>
            <li><a href="#">Paysheet Option</a>
                <ul>
                    <%--Here Start Member Copy --%>
                    <li><a href="#openModal31">View/Print My Paysheet</li>
                    <div id="openModal31" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <h2>View Member Copy</h2>
                                <img id= "icon" src="res/pay.png" width="150px">
                                <table border="0">
                                    <tbody>

                                        <tr>
                                            <td>Month</td>
                                            <td><input type="text" name="designation" value="" size="50" /></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View/Print</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Member Copy --%>

                </ul>
            </li>
            <%--Here End Payroll Options --%>
        </ul>
        <%--End of Main Menu--%>

        <%--First Time Login Window--%>
        <div id="firstlogin" class="modalDialog">
            <div>
                <form id="add" name="adduser" action="User/saveprofile.jsp">
                    <h2>Welcome to the <br>UNICHEM PHARMACY Pvt. Ltd. </h2>
                    <img id= "icon" src="res/emp.png" width="50px">
                    <h3>Enter Your Details</h3>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>Employee ID</td>
                                <td><input type="text" name="iid" value="<%=sessionid%>" readonly="readonly" /></td>
                            </tr>
                            <tr>
                                <td>First Name</td>
                                <td><input type="text" name="ifirstname" value="<%=firstname%>" size="20" /></td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td><input type="text" name="ilastname" value="<%=lastname%>" size="20" /></td>
                            </tr>
                            <tr>
                                <td>Gender</td>
                                <td><input type="radio" name="igender" value="Male" <%=male%> />Male <input type="radio" name="igender" value="Female" <%=female%> />Female</td>
                            </tr>
                            <tr>
                                <td>NIC No</td>
                                <td><input type="text" name="inic" value="<%=nic%>" size="10" /></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><textarea name="iaddress" rows="4" cols="20">
                                        <%=address%>
                                    </textarea></td>
                            </tr>
                            <tr>
                                <td>Contact Number</td>
                                <td><input type="text" name="inumber" value="<%=num%>" size="10" /></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" name="iemail" value="<%=email%>" size="30" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right"><button type="submit">Save Profile</button></td>
                            </tr>
                        </tbody>
                    </table>

                </form>

            </div>
        </div>

        <%--Login Change PopUp--%>
        <div id="changeunpw" class="modalDialog">
            <div>
                <h2>Do you want to change Username & Password</h2>
                <form action="#openModal2" method="POST">
                    <input type="submit" value="Yes" />
                </form>
                <form action="#complete" method="POST">
                    <input type="submit" value="No" />
                </form>
            </div>
        </div>

        <%--ErrorPopUp--%>
        <div id="complete" class="modalDialog">
            <div>
                <a href="#close" title="Close" class="close">X</a>
                <img id= "icon" src="res/Complete.png" width="100px">
                <br>
                <h2>The operation completed successfully.</h2>
                <%response.setHeader("Refresh", "2;url=#close");%>
            </div>
        </div>
        <div id="error" class="modalDialog">
            <div>
                <a href="#close" title="Close" class="close">X</a>
                <img id= "icon" src="res/Error.png" width="100px">
                <br>
                <h2>Error! The operation did not complete.</h2>
                <%response.setHeader("Refresh", "2;url=#close");%>
            </div>
        </div>
        <div id="exception" class="modalDialog">
            <div>
                <a href="#close" title="Close" class="close">X</a>
                <img id= "icon" src="res/Exception.png" width="100px">
                <br>
                <h2>Exception!.</h2>
                <h3><%=session.getAttribute("exMsg")%></h3>
                <%response.setHeader("Refresh", "2;url=#close");%>
            </div>
        </div>

    </body>
</html>
