<%@page import = "STADVDB.*, java.util.*"%>
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
            Movie movie = new movie();
			int movie_ID;
			String movie_name = new String();
			int year;
			float rank;
                
            if(request.getParameter("submit") != null) {
 
				if(request.getParameter("movie_ID") != null) {
                   movie_ID = request.getParameter("movie_ID");
                }
				
                if(request.getParameter("movie_name") != null) {
                    movie_name = request.getParameter("movie_name");
                }
                
                if(request.getParameter("year") != null) {
                    year = request.getParameter("year");
                }
                    
                if(request.getParameter("rank") != null){
                   rank = request.getParameter("rank");
                }
                             
             
                 result = movie.AddMovie(movie_ID,movie_name,year,rank);
            }
        %>
         <form name="myForm" action="CreateMovie.jsp" method="POST">
            <table border="0">
                <tbody>
					<tr>
						<td>Movie ID  : </td>
						<td><input type="text" name="movie_ID" value="2019-01-01" size="50" /></td>
				    </tr>      
			  	    <tr>
                        <td>Movie Title : </td>
                        <td><input type="text" name="movie_name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Year Released : </td>
                        <td><input type="text" name="year" value="00:00:00" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Movie Ranking : </td>
                        <td><input type="text" name="rank" value="00:00:00" size="50" /></td>
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
                            alert("Data Inserted");
                        }
                    }
                -->
            </SCRIPT>
</html>
