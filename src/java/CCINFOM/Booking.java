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

public class Booking {
 public String url = "jdbc:mysql://localhost:3307/transportdb";
    public String username = "root";
    public String password = "p@ssword";
    public PreparedStatement getBookings = null;
    public PreparedStatement insertBookings = null;
    public PreparedStatement deleteBookings = null;
    public PreparedStatement updateBookings = null;
    public ResultSet result = null;
    public Connection connection;
       
    public Booking() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public ResultSet getBookings() {
        try {
            getBookings = connection.prepareStatement("SELECT * FROM bookings");
            result = getBookings.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public ResultSet getBookings(String username) {
        try {
            getBookings = connection.prepareStatement(
                    " SELECT *" + 
                    " FROM bookings" + 
                    " WHERE booking_ID = ?");
            getBookings.setString(1, username);
            result = getBookings.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return result;
        
    }
        
      public int setBooking(
                String booking_ID,
                String start_time,
                String end_time,
                String date_confirmed,
                String date_cancelled,
                String group_ID,
                String Username)
                 {

        int result = 0;
        
        try {
            insertBookings = connection.prepareStatement(
                                "INSERT INTO bookings (booking_ID, start_time, end_time, date_confirmed, date_cancelled, group_ID, username) VALUES (?,?,?,?,?,?,?)");
            insertBookings.setString(1, booking_ID);
            insertBookings.setTime(2, Time.valueOf(start_time));
            insertBookings.setTime(3, Time.valueOf(end_time));
            insertBookings.setDate(4, Date.valueOf(date_confirmed));
            insertBookings.setDate(5, Date.valueOf(date_cancelled));
            insertBookings.setString(6, group_ID);
            insertBookings.setString(7, Username); 
           
            result = insertBookings.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
      
      
    public int deleteBookings (String booking_ID) {
        int result = 0;
        try {
            deleteBookings = connection.prepareStatement(
                    "DELETE" + 
                    " FROM bookings" + 
                    " WHERE booking_ID = ?");
            deleteBookings.setString(1,booking_ID);
            
            result = deleteBookings.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
  
      public int cancelbooking(int booking_ID, String cancel) {
        int result = 0;
        try {
            updateBookings = connection.prepareStatement(
                    " UPDATE bookings b" +
                    " SET b.date_cancelled = ?" +
                    " WHERE b.booking_ID = ?"
            );
            updateBookings.setDate(1, Date.valueOf(cancel));
            updateBookings.setInt(2, booking_ID);
            result = updateBookings.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
      
      
        public ResultSet dailybookings (String year, String month) {
        try {
            getBookings = connection.prepareStatement(       
            "SELECT COUNT(b.booking_ID), SUM(t.amount), DAY(t.trans_date) " +
            "FROM bookings b LEFT JOIN transactions t ON b.booking_ID = t.booking_ID " +
            "WHERE b.date_cancelled IS NULL " + 
            "AND YEAR(t.trans_date) = ? " +
            "AND MONTH(t.trans_date) = ? " +
            "GROUP BY DAY(t.trans_date) "
                        );
            getBookings.setInt(1, Integer.parseInt(year));
            getBookings.setInt(2, Integer.parseInt(month));
            result = getBookings.executeQuery();
        }  catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

