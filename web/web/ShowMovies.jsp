<%@page import = "STADVDB.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Movies</title>
    </head>
    <body>
        <h1>Display Movies</h1>
        <%
            Movie movie = new Movie();
            ResultSet result = movie.getMovies();
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td><b>Movie Name</td>
                    <td><b>Year</td>
                </tr>
                <% while (result.next()){ %>
                <tr>
                    <td><%= result.getString("movie_name")%></td>
                    <td><%= result.getString("year")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
             <a href="mainmenu.html">Back</a>
    </body>
</html>
