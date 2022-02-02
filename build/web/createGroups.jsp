<%-- 
    Document   : createGroups
    Created on : Dec 14, 2019, 4:39:57 PM
    Author     : Aly
--%>

<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a Record</title>
    </head>
    <body onload="displayResults()">
        <h1>Create a Record</h1>
            <%
                int g_ID = 0;
                int result = 0;
                Groups groups = new Groups();
                String group_ID = new String();
                String start_date = new String();
                String username_rep = new String();
                
                if(request.getParameter("submit") != null) {
                    
                    if(request.getParameter("group_ID") != null) {
                        group_ID = request.getParameter("group_ID");
                        g_ID = Integer.parseInt(group_ID);
                    }

                    if(request.getParameter("start_date") != null) {
                        start_date = request.getParameter("start_date");
                    }

                    if(request.getParameter("username_rep") != null) {
                        username_rep = request.getParameter("username_rep");
                    }

                    result = groups.setGroups(g_ID, start_date, username_rep);
                }
        %>
        <form name="myForm" action="createGroups.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Group ID : </td>
                        <td><input type="text" name="group_ID" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Start Date : </td>
                        <td><input type="text" name="start_date" value="2019-01-01" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Representative Username : </td>
                        <td><input type="text" name="username_rep" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
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
                            alert("Data Inserted");
                        }
                    }
                -->
            </SCRIPT>
</html>
