/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jed
 */

package CCINFOM;
import java.sql.*;

public class Movie {
    public String url = "jdbc:mysql://localhost:3307/transportdb";
    public String username = "root";
    public String password = "p@ssword";
    public PreparedStatement getBookings = null;
    public PreparedStatement insertBookings = null;
    public PreparedStatement deleteBookings = null;
    public PreparedStatement updateBookings = null;
    public ResultSet result = null;
    public Connection connection;

    public Movie() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet getMovies() {
        try {
            getMovies = connection.prepareStatement("SELECT * FROM movies");
            result = getMovies.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet getMovies(int id) {
        try {
            getMovies = connection.prepareStatement(
                    " SELECT *" +
                            " FROM movies" +
                            " WHERE id = ?");
            getMovies.setString(1, id);
            result = getMovies.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return result;

    }

    public int addMovie(
            int id,
            String name,
            int year,
            float rank)
    {

        int result = 0;

        try {
            insertMovies = connection.prepareStatement(
                    "INSERT INTO movies (id, name, year, rank) VALUES (?,?,?,?)");
            insertMovies.setInt(1, id);
            insertMovies.setString(2, name);
            insertMovies.setInt(3, year);
            insertMovies.setFloat(4, rank);

            result = insertMovies.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    public int deleteMovies (int id) {
        int result = 0;
        try {
            deleteMovies = connection.prepareStatement(
                    "DELETE" +
                            " FROM movies" +
                            " WHERE id = ?");
            deleteMovies.setString(1,id);

            result = deleteMovies.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updateMovies(int id, String name, int year, float rank) {
        int result = 0;
        try {
            updateMovies = connection.prepareStatement(
                    " UPDATE movies m" +
                            " SET m.name = ?" +
                            " SET m.year = ?" +
                            " SET m.rank = ?" +
                            " WHERE id = ?"
            );
            updateMovies.setInt(1, name);
            updateMovies.setString(2, year);
            updateMovies.setInt(3, rank);
            updateMovies.setFloat(4, id);

            result = updateMovies.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

