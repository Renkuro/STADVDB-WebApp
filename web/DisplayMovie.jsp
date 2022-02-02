<%@page import = "STADVDB.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Movie</title>
    </head>
    <body>
        <h1>Display Movie</h1>
        <%
            Movie movie = new Movie();
            ResultSet result;
            
            String movie_name = request.getParameter("movie_name");
            result = movie.getMovies(movie_name);
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td><b>Movie Title</td>
                    <td><b>Movie ID</td>
                    <td><b>Year Released</td>
                    <td><b>Rank</td>
                </tr>
                <% while (result.next()){ %>
                <tr>
                    <td><%= result.getString("movie_name")%></td>
                    <td><%= result.getInteger("movie_ID")%></td>
                    <td><%= result.getInteger("last_name")%></td>
                    <td><%= result.getFloat("rank")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
            <a href="SearchMovie.jsp">Back</a>
    </body>
</html>
