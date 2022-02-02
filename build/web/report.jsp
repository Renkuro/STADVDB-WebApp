<%-- 
    Document   : report
    Created on : Dec 13, 2019, 1:26:57 PM
    Author     : Luis Angelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Report</title>
    </head>
    <body>
        <h1>Client Report</h1>
        <form name="myForm" action="reportprocess.jsp" method="POST">
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
        <a href="homepage.html">Back</a>
    </body>
</html>
