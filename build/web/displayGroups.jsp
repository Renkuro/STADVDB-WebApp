<%-- 
    Document   : displayGroups
    Created on : Dec 14, 2019, 10:11:26 PM
    Author     : Aly
--%>

<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Record</title>
    </head>
    <body>
        <h1>Display Record</h1>
        <%
            int g_ID = 0;
            Groups groups = new Groups();
            ResultSet result = null;
            String group_ID = new String();
            
            if (request.getParameter("submit") != null) {
                
                if (request.getParameter("group_ID") != null) {
                    group_ID = request.getParameter("group_ID");
                    g_ID = Integer.parseInt(group_ID);
                }
                
                result = groups.getGroups(g_ID);
            }
            
            
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>Start Date</td>
                    <td>End Date</td>
                    <td>Representative Username</td>
                </tr>
                <% while(result.next()) { %>
                <tr>
                    <td><%= result.getString("start_date")%></td>
                    <td><%= result.getString("end_date")%></td>
                    <td><%= result.getString("username_rep")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
    <a href="searchGroups.jsp">Back</a>
</html>

