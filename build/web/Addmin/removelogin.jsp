<%-- 
    Document   : removelogin
    Created on : Nov 27, 2016, 7:56:53 AM
    Author     : HHDev
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = new DbConnector().getConnection();
    Statement stmt = con.createStatement();
    int a = stmt.executeUpdate("DELETE FROM login WHERE ID='" + request.getParameter("empid") + "'");
    if (a > 0) {
        response.sendRedirect("../AdminHome.jsp#complete");
    } else {
        response.sendRedirect("../AdminHome.jsp#error");
    }
%>
