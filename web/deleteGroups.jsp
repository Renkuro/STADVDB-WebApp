<%-- 
    Document   : deleteGroups
    Created on : Dec 14, 2019, 8:08:43 PM
    Author     : Aly
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
            int g_ID = 0;
            int result = 0;
            Groups groups = new Groups();
            ResultSet set =  groups.getGroups();
            String group_ID = new String();
            
            if (request.getParameter("submit") != null) {
                
                if (request.getParameter("g_ID") != null) {
                    group_ID = request.getParameter("g_ID");
                    g_ID = Integer.parseInt(group_ID);
                }
                
                result = groups.deleteGroups(g_ID);
            }
        %>
        <form name="myForm" action="deleteGroups.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Group ID : </td>
                        <td><select name="g_ID">
                                <%while (set.next()) { %>
                                <option value ="<%= set.getInt("group_ID")%>"><%= set.getInt("group_ID")%> <%= set.getString("username_rep")%></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />
            <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="index.html">Back</a>
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
