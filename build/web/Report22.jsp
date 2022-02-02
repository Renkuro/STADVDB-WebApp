<%-- 
    Document   : report22
    Created on : 12 15, 19, 5:19:41 PM
    Author     : Jed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Report</title>
    </head>
    <body>
        <h1>Booking Report</h1>
        <form name="myForm" action="Report2.jsp" method="POST">
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
        <a href="home.html">Back</a>
    </body>
</html>
