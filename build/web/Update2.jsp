<%-- 
    Document   : update
    Created on : Dec 12, 2019
    Author     : Jed
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel a booking</title>
    </head>
    <body onload="displayResults()">
        <h1>Cancel a Booking</h1>
        <%
            int result = 0;
            int b_id = 0;
            Booking booking = new Booking();
            ResultSet set = booking.getBookings();
            String date = new String();
            String booking_ID = new String();
         
            if (request.getParameter("submit") != null) {
                
                if (request.getParameter("booking_ID") != null) {
                    booking_ID = request.getParameter("booking_ID");
                    b_id = Integer.parseInt(booking_ID);
                }   
                
                if (request.getParameter("date_cancelled") != null) {
                    date = request.getParameter("date_cancelled");
                }
                
                result = booking.cancelbooking(b_id, date);
            }
        %>
        <form name="myForm" action="Update2.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Ongoing Bookings : </td>
                        <td><select name="booking_ID">
                                <%while (set.next()) {%>
                                 <option value ="<%= set.getString("booking_ID")%>"><%= set.getString("booking_ID")%> <%= set.getString("username")%> <%= set.getString("group_ID")%></option>
                                <% } %>
                            </select>
                        </td>
                         <tr>
                        <td>Date Canceled : </td>
                        <td><input type="text" name="date_cancelled" value="2019-01-01" size="50" /></td>
                    </tr>
                        
                        
                    </tr>
                </tbody>
            </table>
             <input type="reset" value="Clear" name="clear" />
             <input type="submit" value="Submit" name="submit" />
             <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="home.html">Back</a>
            <a href="Update2.jsp">Refresh</a>
    </body>
            <SCRIPT LANGUAGE ="JAVASCRIPT">
                <!--
                    function displayResults()
                    {
                        if(document.myForm.hidden.value == 1) {
                            alert("Data Updated");
                        }
                    }
                -->
            </SCRIPT>
</html>
