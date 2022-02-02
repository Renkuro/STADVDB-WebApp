<%-- 
    Document   : delete
    Created on : Dec 12, 2019
    Author     : Jedwig Tan
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a Booking</title>
    </head>
    <body onload="displayResults()">
        <h1>Delete a Booking</h1>
        <%
            int result = 0;
            Booking booking = new Booking();
            ResultSet set =  booking.getBookings();
            String booking_ID = new String();
            
            if (request.getParameter("submit") != null) {
                
                if (request.getParameter("booking_ID") != null) {
                    booking_ID = request.getParameter("booking_ID");
                }
                
                result = booking.deleteBookings(booking_ID);
            }
        %>
        <form name="myForm" action="Delete2.jsp" method="POST">
            <table border="0">
               <tbody>
                    <tr>
                        <td>Booking ID : </td>
                        <td><select name="booking_ID">
                                <%while (set.next()) { %>
                                <option value ="<%= set.getString("booking_ID")%>"><%= set.getString("username")%> <%= set.getString("group_ID")%></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
            <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="home.html">Back</a>
    </body>
            <SCRIPT LANGUAGE ="JAVASCRIPT">
                <!-- 
                    function displayResults()
                    {
                        if(document.myForm.hidden.value == 1) {
                            alert("Data Deleted");
                        }
                    }
                -->
            </SCRIPT>
</html>
