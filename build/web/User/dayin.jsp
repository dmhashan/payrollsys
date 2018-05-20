<%-- 
    Document   : dayin
    Created on : Nov 20, 2016, 11:27:18 AM
    Author     : HHDev
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String id = (String)session.getAttribute("sessionloginid");
  String dayintime = request.getParameter("dayintime");
  String[] splt = dayintime.split("\\s+");
  //out.print(id+" "+dayintime+" "+splt[0]);
  
  try{
      Connection con = new DbConnector().getConnection();
      Statement stmt = con.createStatement();
      int a = stmt.executeUpdate("INSERT INTO attendence (ID, date, I_n) VALUES ('"+id+"','"+splt[0]+"','"+dayintime+"')");
      if(a>0){
          //out.print("OK");
          response.sendRedirect("timeInOut.jsp");
      }else{
          response.sendRedirect("../index.jsp#logagain");
      }
  }catch(Exception e){
      //out.print("Error");
      response.sendRedirect("../index.jsp#logagain");
  }
%>