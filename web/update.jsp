<%-- 
    Document   : update
    Created on : Dec 12, 2019, 10:27:15 AM
    Author     : Luis Angelo
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve a Client</title>
    </head>
    <body onload="displayResults()">
        <h1>Approve a Client</h1>
        <%
            int result = 0;
            Client client = new Client();
            ResultSet results = client.getPendingClients();
            String username = new String("");
            
            if (request.getParameter("approve") != null) {
                username = request.getParameter("client");
                result = client.approveClient(username);
            }
            
            else if (request.getParameter("deny") != null) {
                username = request.getParameter("client");
                result = client.denyClient(username);
            }
        %>
        <form name="myForm" action="update.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Pending Clients : </td>
                        <td><select name="client">
                                <%while (results.next()) {%>
                                <option value="<%= results.getString("username")%>"><%= results.getString("first_name")%> <%= results.getString("last_name")%></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
                <input type="submit" value="Deny" name="deny" />
                <input type="submit" value="Approve" name="approve" />
                <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="homepage.html">Back</a>
            <a href="update.jsp">Refresh</a>
    </body>
            <SCRIPT LANGUAGE ="JAVASCRIPT">
                <!--
                    function displayResults()
                    {
                        if(document.myForm.hidden.value == 1) {
                            alert("Data Updated");
                        }
                    }
                -->
            </SCRIPT>
</html>
