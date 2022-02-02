<%-- 
    Document   : searchGroups
    Created on : Dec 14, 2019, 10:07:38 PM
    Author     : Aly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Record</title>
    </head>
    <body>
        <h1>Search Record</h1>
        <form name="myForm" action="displayGroups.jsp" method="POST">
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Group ID : </td>
                        <td><input type="text" name="group_ID" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
        <a href="index.html">Back</a>
    </body>
</html>
    </body>
</html>
