<%-- 
    Document   : display
    Created on : Dec 12, 2019, 8:27:51 AM
    Author     : Luis Angelo
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
            Client client = new Client();
            ResultSet result;
            
            String username = request.getParameter("username");
            result = client.getClients(username);
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td><b>Username</td>
                    <td><b>First Name</td>
                    <td><b>Last Name</td>
                    <td><b>Password</td>
                    <td><b>Gender</td>
                    <td><b>Birthday</td>
                    <td><b>Contact Number</td>
                    <td><b>Address</td>
                    <td><b>Nationality</td>
                    <td><b>Status</td>
                    <td><b>Emergency Contact</td>
                    <td><b>Emergency Contact Number</td>
                    <td><b>Emergency Contact Address</td>
                </tr>
                <% while (result.next()){ %>
                <tr>
                    <td><%= result.getString("username")%></td>
                    <td><%= result.getString("first_name")%></td>
                    <td><%= result.getString("last_name")%></td>
                    <td><%= result.getString("password")%></td>
                    <td><%= result.getString("gender")%></td>
                    <td><%= result.getString("bday")%></td>
                    <td><%= result.getString("contact_no")%></td>
                    <td><%= result.getString("address")%></td>
                    <td><%= result.getString("nationality")%></td>
                    <td><%= result.getString("status")%></td>
                    <td><%= result.getString("EM_name")%></td>
                    <td><%= result.getString("EM_contact_no")%></td>
                    <td><%= result.getString("EM_address")%></td>
                    
                </tr>
                <% } %>
            </tbody>
        </table>
            <a href="search.jsp">Back</a>
    </body>
</html>
