<%-- 
    Document   : display
    Created on : Dec 12, 2019, 8:27:51 AM
    Author     : Luis Angelo
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Booking</title>
    </head>
    <body>
        <h1>Display Booking</h1>
        <%
            Booking booking = new Booking();
            ResultSet result;
            
            String Booking_ID = request.getParameter("booking_ID");
            result = booking.getBookings(Booking_ID);
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>Booking ID</td>
                    <td>Start Time</td>
                    <td>End Time</td>
                    <td>Date Confirmed</td>
                    <td>Date Canceled</td>
                    <td>Group ID</td>
                    <td>username</td>
                </tr>
                <% while(result.next()) { %>
                <tr>
                    <td><%= result.getString("booking_ID")%></td>
                    <td><%= result.getString("start_time")%></td>
                    <td><%= result.getString("end_time")%></td>
                    <td><%= result.getString("date_confirmed")%></td>
                    <td><%= result.getString("date_cancelled")%></td>
                    <td><%= result.getString("group_ID")%></td>
                    <td><%= result.getString("username")%></td>
                </tr>
                <% } %>
             </tbody>
        </table>
            <a href="Search2.jsp">Back</a>
    </body>
</html>
