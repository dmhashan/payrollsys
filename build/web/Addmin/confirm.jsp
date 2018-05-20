<%-- 
    Document   : confirm
    Created on : Nov 16, 2016, 11:24:40 PM
    Author     : HHDev
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        Connection con = new DbConnector().getConnection();
    Statement stmt = con.createStatement();
    String query = "INSERT INTO monthsal("
            + "Month,Year,ID,BSal,Otamnt,GrosSal,etf,epf,NetSal,deduction,Empname,Designation,Convinience,NoPay,Loan,allowence"
            + ") VALUES('"+request.getParameter("year")+"','"+request.getParameter("month")+"','"+request.getParameter("id")+"','"+request.getParameter("basicsal")+"','"+request.getParameter("ottime")+"','"+request.getParameter("grosssal")+"','"+request.getParameter("etf")+"','"+request.getParameter("epf")+"','"+request.getParameter("netsal")+"','"+request.getParameter("deductions")+"','"+request.getParameter("name")+"','"+request.getParameter("designation")+"','"+request.getParameter("convenience")+"','"+request.getParameter("nopay")+"','"+request.getParameter("loan")+"','"+request.getParameter("allowence")+"')";
    int a = stmt.executeUpdate(query);
    if(a>0){
        out.print("Done");
    }else{
        out.print("Error");
        }
    }catch(Exception e){
        out.print(e);
    }
%>
