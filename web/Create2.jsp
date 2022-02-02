<%-- 
    Document   : create
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
        <title>Create a Booking</title>
    </head>
    <body onload="displayResults()">
        <h1>Create a Booking</h1>
        <%
            int result = 0;
            String booking_ID = new String();
            String start_time = new String();
            String end_time = new String();
            String date_confirmed = new String();
            String date_cancelled = new String();
            String group_ID = new String();
            String username = new String();
            Booking booking = new Booking();
            if(request.getParameter("submit") != null) {
 
                if(request.getParameter("booking_ID") != null) {
                    booking_ID = request.getParameter("booking_ID");
                }
                
                if(request.getParameter("start_time") != null) {
                    start_time = request.getParameter("start_time");
                }
                    
                if(request.getParameter("end_time") != null){
                   end_time = request.getParameter("end_time");
                }
                               
                if(request.getParameter("date_confirmed") != null) {
                   date_confirmed = request.getParameter("date_confirmed");
                }
                
                if(request.getParameter("date_cancelled") != null) {
                   date_cancelled = request.getParameter("date_cancelled");
                }
                    
                if(request.getParameter("group_ID") != null) {
                   group_ID  = request.getParameter("group_ID");
                }
                    
                if(request.getParameter("username") != null) {
                   username = request.getParameter("username");
                }
                
                 result = booking.setBooking(booking_ID, start_time, end_time, date_confirmed, date_cancelled, group_ID, username);
            }
        %>
         <form name="myForm" action="Create2.jsp" method="POST">
            <table border="0">
                <tbody>
                   <tr>
                        <td>Booking ID : </td>
                        <td><input type="text" name="booking_ID" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Start time : </td>
                        <td><input type="text" name="start_time" value="00:00:00" size="50" /></td>
                    </tr>
                    <tr>
                        <td>End time : </td>
                        <td><input type="text" name="end_time" value="00:00:00" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Date confirmed  : </td>
                        <td><input type="text" name="date_confirmed" value="2019-01-01" size="50" /></td>
                    </tr>         
                    <tr>
                        <td>Date canceled : </td>
                        <td><input type="text" name="date_cancelled" value="2019-01-01" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Group ID : </td>
                        <td><input type="text" name="group_ID" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Client Username : </td>
                        <td><input type="text" name="username" value="" size="50" /></td>
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
                            alert("Data Inserted");
                        }
                    }
                -->
            </SCRIPT>
</html>
