<%-- 
    Document   : upemp
    Created on : Nov 27, 2016, 4:40:16 AM
    Author     : HHDev
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String empid = request.getParameter("empid");
    String desid = "";
    String depid = "";request.getParameter("depid");
    out.println(desid);
    out.println(depid);
    out.println(empid);
    try{
        Connection con = new DbConnector().getConnection();
        Statement stmt = con.createStatement();
        
        ResultSet rs1 = stmt.executeQuery("SELECT DesID FROM designation WHERE DesName='"+request.getParameter("desid")+"'");
        if(rs1.next()){
            desid = rs1.getString("DesID");
        }else{
            response.sendRedirect("../AdminHome.jsp#error");
        }
        
        ResultSet rs2 = stmt.executeQuery("SELECT DepID FROM department WHERE DepName='"+request.getParameter("depid")+"'");
        if(rs2.next()){
            desid = rs2.getString("DepID");
        }else{
            response.sendRedirect("../AdminHome.jsp#error");
        }
        
        int a = stmt.executeUpdate("UPDATE personaldetails SET DesID='"+desid+"', DepID='"+depid+"' WHERE ID='"+empid+"'");
        if(a>0){
            response.sendRedirect("../AdminHome.jsp#complete");
        }else{
            response.sendRedirect("../AdminHome.jsp#error");
        }
    }catch(Exception e){
        response.sendRedirect("../AdminHome.jsp#exception");
    }
%>