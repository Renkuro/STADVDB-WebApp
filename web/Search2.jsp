<%-- 
    Document   : search
    Created on : Dec 12, 2019
    Author     : Jedwig tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Booking</title>
    </head>
    <body>
        <h1>Search Booking</h1>
        <form name="myForm" action="Display2.jsp" method="POST">
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Booking ID : </td>
                        <td><input type="text" name="booking_ID" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
              <a href="home.html">Back</a>
    </body>
</html>
