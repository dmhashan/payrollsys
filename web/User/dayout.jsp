<%-- 
    Document   : dayin
    Created on : Nov 20, 2016, 11:27:18 AM
    Author     : HHDev
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="my.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = (String) session.getAttribute("sessionloginid");
    String dayouttime = request.getParameter("dayouttime");
    String[] splt = dayouttime.split("\\s+");

    if (id == "null") {
        //out.print("Login Fail");
        response.sendRedirect("../Login_Code#logagain");
    } else {
        try {
            Connection con = new DbConnector().getConnection();
            Statement stmt = con.createStatement();
            int a = stmt.executeUpdate("UPDATE attendence SET O_ut='" + dayouttime + "' WHERE ID='" + id + "' AND date='" + splt[0] + "' ");
            if (a > 0) {
                //out.print("OK");
                response.sendRedirect("timeInOut.jsp");
            }else{
                response.sendRedirect("../index.jsp#logagain");
            }
        } catch (Exception e) {
            //out.print("Error");
            response.sendRedirect("../index.jsp#logagain");
        }
    }
%>

<%
            String nnd = id;
            int hours3 = 0;
            String no = nnd;
            int Ot = 0;
            out.print(nnd);
            try {
                Connection con = new DbConnector().getConnection();
                Statement stmt = con.createStatement();

                String query = "SELECT * FROM attendence WHERE ID='" + nnd + "'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    nnd = rs.getString("iid");
                    String s1 = rs.getString("I_n");
                    String s2 = rs.getString("O_ut");
                    Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s1);

                    Date d2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s2);
                    int hours = (int) ((d2.getTime() - d1.getTime()) / 3600000);

                    query = "update attendence set workedHrs='" + hours + "' where iid=" + nnd;
                    Statement st = con.createStatement();
                    st.executeUpdate(query);

                    if (hours >= 8) {
                        int hours1 = 8;
                        query = "update attendence set Normal_Hrs='" + hours1 + "' where iid=" + nnd;
                        Statement mt = con.createStatement();
                        mt.executeUpdate(query);
                        int hours11 = hours - 8;
                        query = "update attendence set Ot_Hrs='" + hours11 + "' where iid=" + nnd;
                        Statement tt = con.createStatement();
                        tt.executeUpdate(query);

                    } else if (hours < 8 && hours >= 4) {
                        int hours2 = 4;

                        String iu = "update attendence set Normal_Hrs='" + hours2 + "' where iid=" + nnd;
                        Statement qe = con.createStatement();
                        qe.executeUpdate(iu);
                        String ia = "update attendence set Ot_Hrs='" + hours3 + "' where iid=" + nnd;
                        Statement qr = con.createStatement();
                        qr.executeUpdate(ia);
                       

                        }

                     else {

                        String ry = "update attendence set Normal_Hrs='" + hours3 + "' where ID=" + nnd;
                        Statement plk = con.createStatement();
                        plk.executeUpdate(ry);
                        String km = "update attendence set Ot_Hrs='" + hours3 + "' where ID=" + nnd;
                        Statement ph = con.createStatement();
                        ph.executeUpdate(km);

                    }
                }

            } catch (Exception e) {

            }
%>