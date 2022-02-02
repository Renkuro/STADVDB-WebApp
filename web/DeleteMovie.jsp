<%@page import = "STADVDB.*, java.util.*"%>
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
            Movie movie = new movie();
            ResultSet set =  movie.getMovie();
            String movie_ID = new String();
            
            if (request.getParameter("submit") != null) {
                
                if (request.getParameter("movie_ID") != null) {
                    movie_ID = request.getParameter("movie_ID");
                }
                
                result = movie.deleteBookings(movie_ID);
            }
        %>
                 <form name="myForm" action="DeleteMovie.jsp" method="POST">
            <table border="0">
                <tbody>
                   <tr>
                        <td>Movie ID : </td>
                        <td><input type="text" name="movie_ID" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
            <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="mainmenu.html">Back</a>
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
