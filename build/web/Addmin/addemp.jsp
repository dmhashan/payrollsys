<%-- 
    Document   : saveuser
    Created on : Nov 19, 2016, 6:20:34 PM
    Author     : HHDev
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Date dNow = new Date();
    SimpleDateFormat fdate = new SimpleDateFormat("yyyy-MM-dd");
    String date = fdate.format(dNow);
    String empid = request.getParameter("empid");
    String des = request.getParameter("desid");
    String dep = request.getParameter("depid");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    try{
    Connection con = new DbConnector().getConnection();
    Statement stmt = con.createStatement();

    int a = stmt.executeUpdate("INSERT INTO login VALUES ('"+empid+"','"+username+"','"+password+"','0')");
    String q = "INSERT INTO personaldetails (ID,DesID,DepID,JobDate) VALUES ('"+empid+"',(SELECT DesID FROM designation WHERE DesName = '"+des+"'),(SELECT DepID FROM department WHERE DepName = '"+dep+"'),'"+date+"')";
    int b = stmt.executeUpdate(q);
    
    if(a>0 && b>0){
        response.sendRedirect("../AdminHome.jsp#complete");
    }else{
        response.sendRedirect("../AdminHome.jsp#error");
    }
    }catch(Exception e){
    response.sendRedirect("../AdminHome.jsp#exception");
    session.setAttribute("exMsg", e);
    }


%>