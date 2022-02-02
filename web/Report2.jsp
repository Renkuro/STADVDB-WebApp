<%@page import = "CCINFOM.*, java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Report</title>
    </head>
    <body>
        <%
            Booking booking = new Booking();
            ResultSet result = null;
            String year = new String();
            String month = new String();
            
            if(request.getParameter("submit") != null) {
                if(request.getParameter("year") != null && (request.getParameter("month") != null)) {
                    year = request.getParameter("year");
                    month = request.getParameter("month");
                }
                
                result = booking.dailybookings(year, month);
            }
        %>
        <h1>Daily completed Booking</h1><br>
        <%= request.getParameter("year")%> <%= request.getParameter("month")%><br>
        <table border="1">
            <tbody>
                <tr>
                    <td>Completed Bookings : </td>
                    <td>Total Sales: </td>
                    <td>Day : </td>
                </tr>
                <%while (result.next()) { %>
                <tr>
                    <td><%= result.getInt("COUNT(b.booking_ID)")%></td>
                    <td><%= result.getDouble("SUM(t.amount)")%></td>
                    <td><%= result.getString("DAY(t.trans_date)")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="home.html">Back</a>
    </body>
</html>




