<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Bookings</title>
    </head>
    <body>
        <h1>Display Bookings Users</h1>
        <%
            Booking booking = new Booking();
            ResultSet result = booking.getBookings();
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td><b>Booking ID</td>
                    <td><b>Start Time</td>
                    <td><b>End Time</td>
                    <td><b>Group ID</td>
                    <td><b>username</td>
                </tr>
                <% while (result.next()){ %>
                <tr>
                    <td><%= result.getString("booking_ID")%></td>
                    <td><%= result.getString("start_time")%></td>
                    <td><%= result.getString("end_time")%></td>
                    <td><%= result.getString("group_ID")%></td>
                    <td><%= result.getString("username")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
             <a href="home.html">Back</a>
    </body>
</html>
