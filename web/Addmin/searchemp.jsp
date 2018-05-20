<%-- 
    Document   : searchemp
    Created on : Nov 26, 2016, 1:12:44 AM
    Author     : HHDev
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Employee</title>
    </head>
    <body>
        <form name="fresh" action="searchemp.jsp" method="POST">
            <input type="text" name="empid" value="<%=request.getParameter("empid")%>" /><input type="submit" value="Search" />
        </form>
        <%
            try {
                Connection con = new DbConnector().getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM personaldetails WHERE ID = '"+request.getParameter("empid")+"'");
                if(rs.next()){
                    out.print(rs.getString(1));
                }else{
                    out.print("Invalid Employee ID");
                }
            } catch (Exception e) {

            }
        %>
    </body>
</html>
