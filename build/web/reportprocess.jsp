<%-- 
    Document   : reportprocess
    Created on : Dec 13, 2019, 1:28:53 PM
    Author     : Luis Angelo
--%>
<%@page import = "CCINFOM.*, java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Global Distribution of Clients</title>
    </head>
    <body>
        <%
            Client client = new Client();
            ResultSet result = null;
            String year = new String();
            String month = new String();
            
            if(request.getParameter("submit") != null) {
                if(request.getParameter("month") != null && (request.getParameter("month") != null)) {
                    year = request.getParameter("year");
                    month = request.getParameter("month");
                    result = client.clientReport(year, month);
                }
            }
        %>
        <h1>Global Distribution of Clients</h1><br>
        <%= request.getParameter("year")%> <%= request.getParameter("month")%><br>
        <table border="1">
            <tbody>
                <tr>
                    <td>Nationality</td>
                    <td>Number of Customers</td>
                </tr>
                <%while (result.next()) { %>
                <tr>
                    <td><%= result.getString("nationality")%></td>
                    <td><%= result.getInt("count(c.username)")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="report.jsp">Back</a>
    </body>
</html>
