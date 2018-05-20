
<%@page import="my.classes.DbConnector"%>
<%--
    Document   : Paysheet
    Created on : Nov 26, 2016, 5:03:44 PM
    Author     : Roshan Menuka
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="res/paysheet.css" rel="stylesheet" type="text/css">
        <title>Pay sheet</title>
    </head>
    <body>
        <%
            Connection con = new DbConnector().getConnection();
            Statement statement = con.createStatement();
            String id = request.getParameter("id");  
            ResultSet resultset = 
                statement.executeQuery("select * from monthsal where ID ='emp002' ") ; 
            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {}
        %>
        
        <div id='container'>
            <div id='paysheet'>
                <div id='topic'>
                    <p style="font-size: 24px; font-weight: bold;">Unichem Pharmacy</p><br>
                    <p style="margin-top: -40px;">No. 124,<br> No.245,<br>Main Street,<br>Badulla.<br>Contact : 055 264 4435<br></p>
                </div>
                <form action="print">
                   <table>
                    <tr>
                        <td>Employee ID</td>
                        <td> <%= resultset.getString(3) %></td>
                    </tr>
                
                    <tr>
                        <td>Employee Name</td>
                        <td> <%= resultset.getString(12) %></td>
                    </tr>
                     <tr>
                        <td>Designation</td>
                        <td> <%= resultset.getString(13) %></td>
                    </tr>
				<tr>
                    <td>Year and Month</td>
                    <td> <%= resultset.getString(2) %>  <%= resultset.getString(1) %></td>
                </tr>
				
				<tr>
                        <td style="font-size:18px; font-weight: bold;">Earning</td>
                        <td></td>
                        <td style="font-size:18px; font-weight: bold;">Deduction</td>
                        <td></td>
                    </tr>
                
                    <tr>
                        <td>Basic Salary</td>
                        <td> <%= resultset.getString(4) %></td>
			<td>No Pay</td>
                        <td><%= resultset.getString(15)%></td>
                    </tr>
                     <tr>
                        <td>Convenience</td>
                        <td> <%= resultset.getString(14) %></td>
			<td>Loan</td>
                        <td><%= resultset.getString(16)%></td>
                    </tr>
                    
                     <tr>
                        <td>Over Time</td>
                        <td> <%= resultset.getString(5) %></td>
                        <td>EPF</td>
                        <td> <%= resultset.getString(8) %></td>
                    </tr> 
                    
                     <tr>
                        <td>Allowence</td>
                        <td> XXXXXXXXXXXXXX</td>
			<td>ETF</td>
                        <td> <%= resultset.getString(7) %></td>
                    </tr>
                    <tr>
                        <td>Total Earnings</td>
                        <td><%= resultset.getString(6) %>0</td>
			<td>Total Deductions</td>
                        <td><%= resultset.getString(11) %></td>
                    </tr>
                                  
				
			<tr>
                        <td style="font-size:18px; font-weight: bold;">Net Salary</td>
                        <td></td>
                        <td style="font-size:18px;"><%= resultset.getString(10) %></td>
                        <td><button type="submit" style="font: Times New Roman;">Print Paysheet</button></td>
                    </tr>
  

</table>

                </form>
            </div>
        </div>
    </body>
</html>
