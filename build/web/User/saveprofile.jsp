<%-- 
    Document   : saveprofile
    Created on : Nov 26, 2016, 7:26:09 AM
    Author     : HHDev
--%>

<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Profile</title>
    </head>
    <body>
        <%
            String id = request.getParameter("iid");;
            String firstname = request.getParameter("ifirstname");
            String lastname = request.getParameter("ilastname");
            String nic = request.getParameter("inic");
            String gender = request.getParameter("igender");
            String address = request.getParameter("iaddress");
            String connumber = request.getParameter("inumber");
            String email = request.getParameter("iemail");
            try {
                Connection con = new DbConnector().getConnection();
                Statement st = con.createStatement();
                int a = st.executeUpdate("UPDATE personaldetails SET Firstname='" + firstname + "', Lastname='" + lastname + "', NICno='" + nic + "', Gender='" + gender + "', Address='" + address + "', ContactNo='" + connumber + "', Email='" + email + "' WHERE ID='" + id + "'");
                int b = st.executeUpdate("UPDATE login SET activated='1' WHERE ID='"+id+"'");
                if (a > 0 && b > 0) {
                    response.sendRedirect("../UserHome.jsp#changeunpw");
                } else {
                    response.sendRedirect("../UserHome.jsp#error");
                }
            } catch (Exception e) {
                response.sendRedirect("../UserHome.jsp#exception");
                session.setAttribute("exMsg", e);
            }
        %>
    </body>
</html>
