<%-- 
    Document   : Admin_base
    Created on : Nov 14, 2016, 9:54:47 AM
    Author     : Roshan Menuka
        <link href="style_admin_home.css" rel="stylesheet" type="text/css">
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Admin Home</title>
        <link href="res/adminstyle.css" rel="stylesheet" type="text/css">
        <link href="res/popup.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="head">
            <h2>UNICHEM PHARMACY</h1><h2>Pvt. Ltd.</h2>
                 <div>
                <input type="submit" value="Logout" name="Logout"  style="float: right; margin-right: 10px;background-color: #333;
                font-size: 16px;
                color: white;
                padding: 0px 20px;
                border: none;
                cursor: pointer;
                width: 125px;
                height: 40px;
                -webkit-border-radius: 5px;"/>
            </div>
            
            <h3 style="    font-family: 'RobotoDraft', 'Roboto', sans-serif;
             font-size: 24px;
            color: #000000;
             text-align: center;margin-left: 100px;"
             >Administrator profile</h3>
            
        </div>


        <%--Starting Main Menu--%>
        <ul>
            <%--Here Starting Modification List --%>
            <li><a href="#">Employee Modification</a>

                <ul>
                    <%--Here Starting Add New Employee --%>
                    <li><a href="#openModal">Add New Employee</a></li>
                    <%
                        try {
                            Connection con = new DbConnector().getConnection();
                            Statement stmt = con.createStatement();

                            ResultSet rs1 = stmt.executeQuery("SELECT ID FROM personaldetails WHERE ID LIKE '%emp%'");
                            int count = 0;
                            while (rs1.next()) {
                                count++;
                            }
                            String newID;
                            if (count < 9) {
                                newID = "emp00" + String.valueOf(++count);
                            } else if (count < 99) {
                                newID = "emp0" + String.valueOf(++count);
                            } else {
                                newID = "emp" + String.valueOf(++count);
                            }
                    %>
                    
                    <div id="openModal" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="saveuser" action="Addmin/addemp.jsp">
                                <h2>Add New Employee</h2>
                                <img id= "icon" src="res/emp.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Employee ID</td>
                                            <td><input type="text" name="empid" value="<%=newID%>" readonly="readonly"/></td>
                                        </tr>

                                        <tr>
                                            <td>Designation</td>
                                            <td><select name="desid">

                                                    <%

                                                        //Connection con = new DbConnector().getConnection();
                                                        //Statement stmt = con.createStatement();
                                                        ResultSet rs2 = stmt.executeQuery("SELECT * FROM designation");

                                                        while (rs2.next()) {%>
                                                    <option><%= rs2.getString(2)%></option>
                                                    <% }%>



                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>Department</td>
                                            <td><select name="depid">

                                                    <%
                                                        ResultSet rs3 = stmt.executeQuery("SELECT * FROM department");

                                                        while (rs3.next()) {%>
                                                    <option><%= rs3.getString(2)%></option>
                                                    <% }%>

                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>Username</td>
                                            <td><input type="text" name="username" value="<%=newID%>" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td>Password</td>
                                            <td><input type="text" name="password" value="<%=newID%>" readonly="readonly" /></td>
                                        </tr>
                                        <%
                                            } catch (Exception e) {
                                            }
                                        %>
                                        <tr>
                                            <td></td>
                                            <td><button type="submit">Submit</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Add New Employee --%>

                    <%--Here Starting Search Employee --%>
                    <li><a href="#openModal1">Search Employee</a></li>
                    <div id="openModal1" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="searchemp" target="_blank" action="Addmin/searchemp.jsp">
                                <h2>Search Employee</h2>
                                <img id= "icon" src="res/search.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Enter Employee ID</td>
                                            <td><input type="text" name="empid" value="" size="6"/></td>
                                        </tr>


                                        <tr>
                                            <td></td>
                                            <td><button type="submit">Search</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Search Employee --%>

                    <%--Here Starting Update Employee --%>
                    <li><a href="#openModal2">Update Employee</a></li>
                    <div id="openModal2" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <h2>Update Employee</h2>
                                <img id= "icon" src="res/uprem.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Employee ID</td>
                                            <td><select name="desid">

                                                    <%

                                                        Connection con = new DbConnector().getConnection();
                                                        Statement stmt = con.createStatement();
                                                        ResultSet rs1 = stmt.executeQuery("SELECT ID FROM personaldetails");

                                                        while (rs1.next()) {%>
                                                    <option><%= rs1.getString(1)%></option>
                                                    <% }%>



                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Designation</td>
                                            <td><select name="desid">

                                                    <%

                                                        ResultSet rs2 = stmt.executeQuery("SELECT * FROM designation");

                                                        while (rs2.next()) {%>
                                                    <option><%= rs2.getString(2)%></option>
                                                    <% }%>



                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Department</td>
                                            <td><select name="desid">

                                                    <%

                                                        ResultSet rs3 = stmt.executeQuery("SELECT * FROM department");

                                                        while (rs3.next()) {%>
                                                    <option><%= rs3.getString(2)%></option>
                                                    <% }%>



                                                </select>
                                            </td>
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
                    
                    <%--Here End Update Employee --%>

                    <%--Here Starting Remove Employee --%>
                    <li><a href="#openModal3">Remove Employee</a></li>
                    <div id="openModal3" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <h2>Remove Employee</h2>
                                <img id= "icon" src="res/uprem.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Employee ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>


                                        <tr>
                                            <td></td>
                                            <td><button type="submit">Remove</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Remove Employee --%>


                </ul>
            </li>
            <%--Here End Modification List --%>




            <%--Here Starting Salary Modification List --%>
            <li><a href="#">Salary Modification</a>
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
                                            <td>Designation ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>


                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                            <form id="add" name="adduser" action="AddUSer">
                                <h2>Update Basic Salary</h2>

                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Designation ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>
                                    <tbody>
                                        <tr>
                                            <td>New Salary</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
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
                                            <td>Designation ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>


                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                            <form id="add" name="adduser" action="AddUSer">
                                <h2>Update Convenience</h2>

                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Designation ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>
                                    <tbody>
                                        <tr>
                                            <td style="font-size: 13px;">New Convenience</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
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
                                            <td>Bonus Month</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>


                            </form>

                            <form id="add" name="adduser" action="AddUSer">
                                <h2>Update Bonus</h2>

                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Month</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>
                                        <tr>
                                            <td>Designation ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
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
                    <%--End Bonus--%>

                    <%--Start Deduction--%>
                    <li><a href="#openModal24">Deduction Details</a></li>
                    <div id="openModal24" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">

                                <img id= "icon" src="res/sal.png" width="100px">
                                <h2>Deduction salary</h2>
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Employee ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>
                                        <tr>
                                            <td>Deduction Cost</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>


                                        <tr>
                                            <td></td>
                                            <td><button type="submit">Deduct</button></td>
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
            <li><a href="#">Payroll Options</a>
                <ul>
                    <%--Here Start Member Copy --%>
                    <li><a href="#openModal31">View/Print Member Copy</li>
                    <div id="openModal31" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <h2>View Member Copy</h2>
                                <img id= "icon" src="res/pay.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Employee ID</td>
                                            <td><input type="text" name="empid" value="" size="50"  /></td>
                                        </tr>

                                        <tr>
                                            <td>Month</td>
                                            <td><input type="text" name="designation" value="" size="50" /></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here End Member Copy --%>
                    <%--Here start Monthly Copy --%>
                    <li><a href="#openModal32">View/Print Monthly Report</li>
                    <div id="openModal32" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <form id="add" name="adduser" action="AddUSer">
                                <h2>View Month Copy</h2>
                                <img id= "icon" src="res/pay.png" width="150px">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td>Month</td>
                                            <td><input type="text" name="designation" value="" size="50" /></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td><button type="submit">View</button></td>
                                        </tr>


                                    </tbody>
                                </table>

                            </form>

                        </div>
                    </div>
                    <%--Here end Monthly Copy --%>
                </ul>
            </li>
            <%--Here End Payroll Options --%>
        </ul>
        <%--End of Main Menu--%>

        
        <%--ErrorPopUp--%>
        <div id="complete" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <img id= "icon" src="res/Complete.png" width="100px">
                            <br>
                            <h2>The operation completed successfully.</h2>
                            <%response.setHeader("Refresh", "2;url=AdminHome.jsp#close");%>
                        </div>
        </div>
        <div id="error" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <img id= "icon" src="res/Error.png" width="100px">
                            <br>
                            <h2>Error! The operation did not complete.</h2>
                            <%response.setHeader("Refresh", "2;url=AdminHome.jsp#close");%>
                        </div>
        </div>
        <div id="exception" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <img id= "icon" src="res/Exception.png" width="100px">
                            <br>
                            <h2>Exception!.</h2>
                            <h3><%=session.getAttribute("exMsg")%></h3>
                            <%response.setHeader("Refresh", "2;url=AdminHome.jsp#close");%>
                        </div>
        </div>
        
    </body>
</html>
