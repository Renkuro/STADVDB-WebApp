
<%-- 
    Document   : updateGroups
    Created on : Dec 14, 2019, 9:58:37 PM
    Author     : Aly
--%>

<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update a Record</title>
    </head>
    <body onload="displayResults()">
        <h1>Update End Date</h1>
        <%
            int result = 0;
            int g_ID = 0;
            Groups groups = new Groups();
            ResultSet results = groups.getGroups();
            String group_ID = new String();
            String end_date = new String();

            if (request.getParameter("submit") != null) {
                if (request.getParameter("group_ID") != null) {
                        group_ID = request.getParameter("group_ID");
                        g_ID = Integer.parseInt(group_ID);
                    }   

                if (request.getParameter("end_date") != null) {
                        end_date = request.getParameter("end_date");
                    }

                    result = groups.endGroups(g_ID, end_date);      
                }
        %>
       <form name="myForm" action="endGroups.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Groups: </td>
                        <td><select name="group_ID">
                                <%while (results.next()) {%>
                                 <option value ="<%= results.getString("group_ID")%>"><%= results.getString("start_date")%> <%= results.getString("username_rep")%></option>
                                <% } %>
                            </select>
                        </td>
                         <tr>
                        <td>End Date : </td>
                        <td><input type="text" name="end_date" value="2020-01-01" size="50" /></td>
                    </tr>
                    </tr>
                </tbody>
            </table>
             <input type="reset" value="Clear" name="clear" />
             <input type="submit" value="Submit" name="submit" />
             <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="index.html">Back</a>
            <a href="endGroups.jsp">Refresh</a>
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

