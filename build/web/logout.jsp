<%-- 
    Document   : logour
    Created on : Nov 27, 2016, 10:16:10 PM
    Author     : HHDev
--%>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>