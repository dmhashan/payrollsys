<%-- 
    Document   : approval
    Created on : Nov 26, 2016, 6:35:34 PM
    Author     : HHDev
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String no = request.getParameter("empid");

    int i = 0;
    int k = 0;
    int otp = 1000;
    int Ot = 0;
    String n = "", m = "", o = "", p = "", q, r = "", l = "", year = "", month="";
    int ottt = 0, etf = 0, epf = 0, grosssal = 0, ded = 0, netsal = 0;

    q = request.getParameter("allowance");

    try {
        Connection con = new DbConnector().getConnection();
        Statement aab = con.createStatement();

        Calendar rr1 = Calendar.getInstance();
        rr1.set(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), 25);
        Calendar rr2 = Calendar.getInstance();
        rr2.set(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), 25);
        rr2.add(Calendar.MONTH, -1);
        SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
        //out.print(no);
        String sttt = "SELECT * FROM attendence WHERE date BETWEEN '" + df2.format(rr2.getTime()) + "' AND '" + df1.format(rr2.getTime()) + "' AND ID ='" + no + "'";

        Statement nbv = con.createStatement();
        ResultSet ya = nbv.executeQuery(sttt);
        SimpleDateFormat df3 = new SimpleDateFormat("MMM");
        SimpleDateFormat df4 = new SimpleDateFormat("yyyy");
        //out.println(df3.format(rr1.getTime()));
        //out.println(df4.format(rr1.getTime()));
        year = df3.format(rr1.getTime());
        month = df4.format(rr1.getTime());
        while (ya.next()) {

            int h = ya.getInt("Ot_hrs");
            Ot = (Ot + h);
            //out.print(Ot);
        }
        ottt = Ot * otp;

        String ipb = "SELECT DesID, Firstname, Lastname, DepID from personaldetails where ID='" + no + "'";
        Statement qxl = con.createStatement();
        ResultSet ghi = qxl.executeQuery(ipb);
        if (ghi.next()) {
            n = ghi.getString("DesID");
            m = ghi.getString("Firstname");
            o = ghi.getString("Lastname");
            p = ghi.getString("DepID");
            if (!(n.isEmpty())) {
                String c1 = "SELECT B_Sal,Convinience,DesName FROM designation where DesID='" + n + "'";
                Statement st1 = con.createStatement();
                ResultSet rt1 = st1.executeQuery(c1);
                if (rt1.next()) {
                    i = rt1.getInt("B_Sal");
                    k = rt1.getInt("Convinience");
                    l = rt1.getString("DesName");
                    etf = (i / 100) * 3;
                    epf = (i / 100) * 10;
                    int er = Integer.parseInt(q);
                    grosssal = i + ottt + k + er;
                    ded = etf + epf;

                    netsal = grosssal - ded;
                }
                String c2 = "SELECT DepName FROM department where DepID='" + p + "'";
                Statement st2 = con.createStatement();
                ResultSet rt2 = st2.executeQuery(c2);
                if (rt1.next()) {
                    r = rt2.getString("DepName");
                }
            }
        }
    } catch (Exception e) {
        //out.print(e);
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../res/paysheet.css" rel="stylesheet" type="text/css">
        <title>Pay sheet</title>
    </head>
    <body>

        <div id='container'>
            <div id='paysheet'>
                <div id='topic'>
                    <p style="font-size: 24px; font-weight: bold;">UNICHEM Pharmacy</p><br>
                    <p style="margin-top: -40px;">No. 124,<br> No.245,<br>Main Street,<br>Badulla.<br>Contact : 055 264 4435<br></p>
                </div>
                <form action="confirm.jsp" method="POST">
                    <table>
                        <tr>
                            <td>Employee ID</td>
                            <td><input type="text" name="id" value="<%=no%>" readonly="readonly" /></td>
                        </tr>

                        <tr>
                            <td>Employee Name</td>
                            <td><input type="text" name="name" value="<%=m+" "+o%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td>Designation</td>
                            <td><input type="text" name="designation" value="<%=l%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td>Year and Month</td>
                            <td><input type="text" name="year" value="<%=year%>" readonly="readonly"/><input type="text" name="month" value="<%=month%>" readonly="readonly"/></td>
                        </tr>

                        <tr>
                            <td style="font-size:18px; font-weight: bold;">Earning</td>
                            <td></td>
                            <td style="font-size:18px; font-weight: bold;">Deduction</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>Basic Salary</td>
                            <td><input type="text" name="basicsal" value="<%=i%>" readonly="readonly" /></td>
                            <td>No Pay</td>
                            <td><input type="text" name="nopay" value="0" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td>Convenience</td>
                            <td><input type="text" name="convenience" value="<%=k%>" readonly="readonly" /></td>
                            <td>Loan</td>
                            <td><input type="text" name="loan" value="0" readonly="readonly" /></td>
                        </tr>

                        <tr>
                            <td>Over Time</td>
                            <td><input type="text" name="ottime" value="<%=ottt%>" readonly="readonly" /></td>
                            <td>EPF</td>
                            <td><input type="text" name="epf" value="<%=epf%>" readonly="readonly" /></td>
                        </tr> 

                        <tr>
                            <td>Allowence</td>
                            <td><input type="text" name="allowence" value="<%=q%>" readonly="readonly" /></td>
                            <td>ETF</td>
                            <td><input type="text" name="etf" value="<%=etf%>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td>Total Earnings</td>
                            <td><input type="text" name="grosssal" value="<%=grosssal%>" readonly="readonly" /></td>
                            <td>Total Deductions</td>
                            <td><input type="text" name="deductions" value="<%=ded%>" readonly="readonly" /></td>
                        </tr>


                        <tr>
                            <td style="font-size:18px; font-weight: bold;">Net Salary</td>
                            <td>
                                <input type="hidden" name="month" value="" readonly="readonly" />
                                <input type="hidden" name="year" value="" readonly="readonly" />
                            </td>
                            <td style="font-size:18px;"><input type="text" name="netsal" value="<%=netsal%>" readonly="readonly" /></td>
                            <td><button type="submit" style="font: Times New Roman;">Confirm</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
