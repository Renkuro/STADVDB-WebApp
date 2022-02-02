<%-- 
    Document   : groups
    Created on : Dec 14, 2019, 10:39:14 PM
    Author     : Aly
--%>

<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Client Groups</title>
    </head>
    <body>
        <h1>Display Client Groups</h1>
        <%
            Groups groups = new Groups();
            ResultSet result = groups.getGroups();
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td><b>Group ID</td>
                    <td><b>Start Date</td>
                    <td><b>End Date</td>
                    <td><b>Representative Username</td>
                </tr>
                <% while (result.next()){ %>
                <tr>
                    <td><%= result.getString("group_ID")%></td>
                    <td><%= result.getString("start_date")%></td>
                    <td><%= result.getString("end_date")%></td>
                    <td><%= result.getString("username_rep")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
    <a href="index.html">Back</a>
</html>
