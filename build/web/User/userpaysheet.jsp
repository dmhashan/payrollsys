<%-- 
    Document   : paysheet
    Created on : Nov 27, 2016, 9:08:27 PM
    Author     : HHDev
--%>

<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../res/paysheet.css" rel="stylesheet" type="text/css">
        <title>Pay sheet</title>
    </head>
    <body>

        <%
            Connection con = new DbConnector().getConnection();
            Statement stmt = con.createStatement();
            String id = String.valueOf(session.getAttribute("sessionloginid"));
            String month = request.getParameter("month");
            ResultSet resultset = stmt.executeQuery("SELECT * FROM monthsal WHERE ID ='" + id + "' AND Month='" + month + "'");

            if (!resultset.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {
            }
        %>

        <div id='container'>
            <div id='paysheet'>
                <div id='topic'>
                    <p style="font-size: 24px; font-weight: bold;">Unichem Pharmacy</p><br>
                    <p style="margin-top: -40px;">No. 124,<br> No.245,<br>Main Street,<br>Badulla.<br>Contact : 055 264 4435<br></p>
                </div>
                <form action="print">
                    <table style="padding-left:5px">
                        <tr>
                            <td>Employee ID</td>
                            <td> <%= resultset.getString(3)%></td>
                        </tr>

                        <tr>
                            <td>Employee Name</td>
                            <td> <%= resultset.getString(12)%></td>
                        </tr>
                        <tr>
                            <td>Designation</td>
                            <td> <%= resultset.getString(13)%></td>
                        </tr>
                        <tr>
                            <td>Year and Month</td>
                            <td> <%= resultset.getString(2)%>  <%= resultset.getString(1)%></td>
                        </tr>

                        <tr>
                            <td style="font-size:18px; font-weight: bold;">Earning</td>
                            <td></td>
                            <td style="font-size:18px; font-weight: bold;">Deduction</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>Basic Salary</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(4)%>.00</td>
                            <td>No Pay</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(15)%>.00</td>
                        </tr>
                        <tr>
                            <td>Convenience</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(14)%>.00</td>
                            <td>Loan</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(16)%>.00</td>
                        </tr>

                        <tr>
                            <td>Over Time</td>
                            <td style="text-align: right; padding-right: 50px"> <%= resultset.getString(5)%>.00</td>
                            <td>EPF</td>
                            <td style="text-align: right; padding-right: 50px"> <%= resultset.getString(8)%>.00</td>
                        </tr> 

                        <tr>
                            <td>Allowence</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(9)%>.00</td>
                            <td>ETF</td>
                            <td style="text-align: right; padding-right: 50px"> <%= resultset.getString(7)%>.00</td>
                        </tr>
                        <tr>
                            <td>Total Earnings</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(6)%>.00</td>
                            <td>Total Deductions</td>
                            <td style="text-align: right; padding-right: 50px"><%= resultset.getString(11)%>.00</td>
                        </tr>


                        <tr>
                            <td style="font-size:18px; font-weight: bold;">Net Salary</td>
                            <td></td>
                            <td style="font-size:18px; text-align: right; padding-right: 50px"><%= resultset.getString(10)%>.00</td>
                            <td><input type="button" value="Print this page" onClick="window.print()"></td>
                        </tr>


                    </table>

                </form>
            </div>
        </div>
    </body>
</html>


</body>
</html>