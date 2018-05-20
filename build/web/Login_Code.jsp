<%-- 
    Document   : login
    Created on : Nov 13, 2016, 12:33:12 PM
    Author     : HHDev
--%>

<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>

        <%
            String jusername = request.getParameter("inusername");
            String jpassword = request.getParameter("inpassword");
            try {
                Connection con = new DbConnector().getConnection();
                Statement st = con.createStatement();
                ResultSet rs;

                rs = st.executeQuery("SELECT * FROM login WHERE username='" + jusername + "' AND password='" + jpassword + "' AND ID LIKE '%adm%' ");
                if (rs.next()) {
                    response.sendRedirect("AdminHome.jsp");
                } else {

                    rs = st.executeQuery("SELECT * FROM login WHERE username='" + jusername + "' AND password='" + jpassword + "' AND ID LIKE '%emp%' ");
                    if (rs.next()) {
                        session.setAttribute("sessionloginid", rs.getString(1));
                        if (rs.getString(4).equals("0")) {
                            response.sendRedirect("UserHome.jsp#firstlogin");
                        } else {
                            String ip = request.getRemoteAddr();
                            if ("0:0:0:0:0:0:0:1".equals(ip)) {
                                response.sendRedirect("User/timeInOut.jsp");
                            } else {
                                response.sendRedirect("UserHome.jsp");
                            }
                        }
                    } else {
                        response.sendRedirect("#invalid");
                        //out.print("Invalid Username password");
                    }
                }
                con.commit();
            } catch (Exception e) {
                //response.sendRedirect("#logagain");
                //System.out.println("DB related Error");
            }
        %>        
    </body>
</html>
