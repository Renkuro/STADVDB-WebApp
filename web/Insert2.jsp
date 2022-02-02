<%-- 
    Document   : insert
    Created on : Dec 12, 2019, 8:49:09 AM
    Author     : Jedwig Tan
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert a Booking</title>
    </head>
    <body>
        <h1>Insert a Booking</h1>
        <p><table border="1">
            <tbody>
                <tr>
                    <td><%= request.getParameter("booking_ID")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("start_time")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("end_time")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("date_confirmed")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("date_cancelled")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("group_ID")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("username")%></td>
                </tr>
            </tbody>
        </table>
    </p>
    </body>
</html>
