<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Record</title>
    </head>
    <body>
        <h1>Search Record</h1>
        <%
            Movie movie = new Movie();
            ResultSet result = movie.getMovies();
        %>
        <form name="myForm" action="display.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Username : </td>
                        <td>
                            <select name="username">
                                <%while (result.next()) { %>
                                <option value = "<%= result.getString("movie_name")%>"><%= result.getString("movie_name")%></option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
            <a href="homepage.html">Back</a>
    </body>
</html>
