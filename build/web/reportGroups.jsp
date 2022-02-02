<%-- 
    Document   : reportGroups
    Created on : Dec 15, 2019, 6:19:00 PM
    Author     : Aly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report 1</title>
    </head>
    <body>
        <h1>Report 1</h1>
        <form name="myForm" action="reportGroups2.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Year : </td>
                        <td><input type="text" name="year" value="2019" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Month : </td>
                        <td><input type="text" name="month" value="1" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
        <a href="index.html">Back</a>
    </body>
</html>
