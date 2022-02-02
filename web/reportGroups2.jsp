<%-- 
    Document   : reportGroups2
    Created on : Dec 15, 2019, 7:34:34 PM
    Author     : Asus
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report 1</title>
    </head>
    <body>
        <h1>Monthly Completed, Cancelled, Sales</h1>
        <%
            Groups groups = new Groups();
            ResultSet result = null;
            String year = new String();
            String month = new String();
            
            if(request.getParameter("submit") != null) {
                if(request.getParameter("month") != null && (request.getParameter("month") != null)) {
                    year = request.getParameter("year");
                    month = request.getParameter("month");
                    result = groups.groupsReport(year, month);
                }
            }
        %>
        <%= request.getParameter("year")%> <%= request.getParameter("month")%><br>
        <table border="1">
            <tbody>
                <tr>
                    <td>Completed</td>
                    <td>Cancelled</td>
                    <td>Total Sales</td>
                </tr>
                <%while (result.next()) { %>
                <tr>
                    <td><%= result.getInt("(SELECT COUNT(b.booking_ID)) - (SELECT COUNT(b.date_cancelled))")%></td>
                    <td><%= result.getInt("COUNT(b.date_cancelled)")%></td>
                    <td><%= result.getDouble("SUM(t.amount)")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="reportGroups.jsp">Back</a>
    </body>
</html>