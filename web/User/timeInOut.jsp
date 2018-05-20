<%-- 
    Document   : timeInOut
    Created on : Nov 26, 2016, 1:24:37 PM
    Author     : Roshan Menuka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../res/time.css" rel="stylesheet" type="text/css">
        <link href="../res/popup.css" rel="stylesheet" type="text/css">
        <title>Time In Out</title>
    </head>
    <body>

        <div id='containe'>
            <div id='box'>
                <%
                    Connection con = new DbConnector().getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs;
                    String id = (String) session.getAttribute("sessionloginid");
                    //out.print(id);
                    rs = st.executeQuery("SELECT * FROM personaldetails WHERE ID='" + id + "'");
                    String fullname = "";
                    if (rs.next()) {
                        fullname = rs.getString(1) + " " + rs.getString(2);
                    } else {
                        //response.sendRedirect("#error");
                    }

                    Date dNow = new Date();
                    SimpleDateFormat fdate = new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat ftime = new SimpleDateFormat("HH:mm:ss");
                    SimpleDateFormat fhour = new SimpleDateFormat("HH");
                    String date = fdate.format(dNow);
                    String time = ftime.format(dNow);
                    int hour = Integer.parseInt(fhour.format(dNow));
                    String datetime = date + " " + time;

                    String disout = "", valout = "DayOut";
                    String disin = "", valin = "DayIn";

                    ResultSet bin = st.executeQuery("SELECT * FROM attendence WHERE ID='" + id + "' AND I_n LIKE '%" + date + "%'");
                    if (bin.next()) {
                        disin = "disabled";
                        valin = "DayIn at " + bin.getString(2).substring(11, 16);
                    } else if (hour < 8 || hour >= 12) {
                        disin = "disabled";
                        disout = "disabled";
                    }

                    ResultSet bout = st.executeQuery("SELECT * FROM attendence WHERE ID='" + id + "' AND O_ut LIKE '%" + date + "%' ");
                    if (bout.next()) {
                        disout = "disabled";
                        valout = "DayOut at " + bout.getString(3).substring(11, 16);
                    }
                    if (hour < 12 || hour >= 20) {
                        disout = "disabled";
                    }

                %>
                <div>

                    <table border="0" cellpadding="10">
                        <tbody style="fon" >
                            <tr>
                                <!--td style="text-align: center">Login Time : <%=datetime%></td-->
                            </tr>

                            <tr>
                                <td><form name="dayin" action="dayin.jsp" method="POST" style="margin-left: -20px; margin-top: -50px;">
                                        <br><input type="hidden" name="dayintime" value="<%=datetime%>" readonly="readonly"  style="color: black;"/>
                                        <input type="submit" value="<%=valin%>" name="bdayin" <%=disin%> />
                                    </form></td>
                                <td><form name="dayout" action="dayout.jsp" method="POST" style="margin-left: -305px; margin-top: -50px; ">
                                        <br><input type="hidden" name="dayouttime" value="<%=datetime%>" readonly="readonly" />
                                        <input type="submit" value="<%=valout%>" name="bdayout" <%=disout%>/>
                                    </form></td>
                            </tr>
                            <tr>
                                <td>
                                    <form action="../logout.jsp" method="POST">
                                        <input type="submit" value="Logout" name="Logout"  style="width: 150px;margin-left: 185px; margin-top: -80px;"/>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form action="../UserHome.jsp" method="POST">
                                    <input type="submit" value="Skip>>" name="Skip" style="width: 150px;margin-left: 390px; margin-top: 0px;" />
                                    </form>
                                </td>

                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
