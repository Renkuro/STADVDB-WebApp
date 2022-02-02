<%-- 
    Document   : delete
    Created on : Dec 12, 2019, 10:08:34 AM
    Author     : Luis Angelo
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a Record</title>
    </head>
    <body onload="displayResults()">
        <h1>Delete a Record</h1>
        <%
            int result = 0;
            Client client = new Client();
            ResultSet set =  client.getDeletableClients();
            String username = new String();
            
            if (request.getParameter("submit") != null) {
                
                if (request.getParameter("username") != null) {
                    username = request.getParameter("username");
                }
                
                result = client.deleteClient(username);
            }
        %>
        <form name="myForm" action="delete.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Username : </td>
                        <td><select name="username">
                                <%while (set.next()) { %>
                                <option value ="<%= set.getString("username")%>"><%= set.getString("first_name")%> <%= set.getString("last_name")%></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />
            <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="homepage.html">Back</a>
            <a href="delete.jsp">Refresh</a>
    </body>
            <SCRIPT LANGUAGE ="JAVASCRIPT">
                <!-- 
                    function displayResults()
                    {
                        if(document.myForm.hidden.value == 1) {
                            alert("Data Deleted");
                        }
                    }
                -->
            </SCRIPT>
</html>
