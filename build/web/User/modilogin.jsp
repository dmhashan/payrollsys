<%-- 
    Document   : modilogin
    Created on : Nov 26, 2016, 11:04:26 PM
    Author     : HHDev
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = String.valueOf(session.getAttribute("sessionloginid"));
    String un = request.getParameter("un");
    String pw = request.getParameter("pw");
    //String newpw = request.getParameter("newpw");
    if ( request.getParameter("oldpw").equals(request.getParameter("oldpw2")) && request.getParameter("pw").equals(request.getParameter("newpw")) ) {
        //out.print("Match");
        try{
            Connection con = new DbConnector().getConnection();
            Statement stmt = con.createStatement();
            int a = stmt.executeUpdate("UPDATE login SET username='"+un+"', password='"+pw+"' WHERE ID='"+id+"'");
            response.sendRedirect("../UserHome.jsp#complete");
        }catch(Exception e){
            response.sendRedirect("../UserHome.jsp#exception");
            session.setAttribute("exMsg", e);
        }
        
    } else {
        response.sendRedirect("../UserHome.jsp#openModal2");
    }

%>