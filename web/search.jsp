<%-- 
    Document   : search
    Created on : Feb 2, 2022, 06:05:41 PM
    Author     : Darren Tan
--%>
<%@page import = "STADVDB.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Movie Record</title>
    </head>
    <body>
        <h1>Search Movie Record</h1>
        <%
            Client client = new Client();
            ResultSet result = client.getClients();
        %>
        <form name="myForm" action="display.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Movie : </td>
                        <td>
                            <input type="text" placeholder="Search..">
                                <%while (result.next()) { %>
                                <a href> <%= result.getString("name")%> <%= result.getInt("year")%> </a>
                                <% } %>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
            <a href="homepage.html">Back</a>
    </body>
</html>
