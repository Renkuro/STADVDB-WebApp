/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CCINFOM;
import java.sql.*;

/**
 *
 * @author Aly
 */
public class Groups {
    public String url = "jdbc:mysql://localhost:3307/transportdb";
    public String username = "root";
    public String password = "p@ssword";
    public PreparedStatement getGroups = null;
    public PreparedStatement insertGroups = null;
    public PreparedStatement deleteGroups = null;
    public PreparedStatement updateGroups = null;
    public ResultSet result = null;
    public Connection connection;
    
     public Groups() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public ResultSet getGroups() {
        try {
            getGroups = connection.prepareStatement("SELECT * FROM clientgroups");
            result = getGroups.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
            
        }
        return result;
    }
     
     public ResultSet getGroups(int group_ID) {
        try {
            getGroups = connection.prepareStatement(
                    " SELECT *" + 
                    " FROM clientgroups" + 
                    " WHERE group_ID = ?");
            getGroups.setInt(1, group_ID);
            result = getGroups.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    public int setGroups(int group_ID, String start_date, String username_rep)
    {          
        int result = 0;

        try {
            insertGroups = connection.prepareStatement(
                                "INSERT INTO clientgroups (group_ID, start_date, username_rep) VALUES (?,?,?)");
            insertGroups.setInt(1, group_ID);
            insertGroups.setDate(2, Date.valueOf(start_date));
            insertGroups.setString(3, username_rep);

            result = insertGroups.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public int deleteGroups (int group_ID) {
        int result = 0;
        try {
            deleteGroups = connection.prepareStatement(
                    "DELETE FROM clientgroups WHERE group_ID = ?"
            );
            deleteGroups.setInt(1, group_ID);
            result = deleteGroups.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public int changeGroups(int group_ID, String username_rep) {
        int result = 0;
        try {
            updateGroups = connection.prepareStatement(
                    " UPDATE clientgroups cg" +
                    " SET cg.username_rep = ?" + 
                    " WHERE cg.group_ID = ?"
            );
            updateGroups.setString(1, username_rep);
            updateGroups.setInt(2, group_ID);
            result = updateGroups.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public int endGroups(int group_ID, String end_date) {
        int result = 0;
        try {
            updateGroups = connection.prepareStatement(
                    " UPDATE clientgroups cg" +
                    " SET cg.end_date = ?" + 
                    " WHERE cg.group_ID = ?"
            );
            updateGroups.setDate(1, Date.valueOf(end_date));
            updateGroups.setInt(2, group_ID);
            result = updateGroups.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
        public ResultSet groupsReport (String year, String month) {
        try {
            getGroups = connection.prepareStatement(
                    " SELECT (SELECT COUNT(b.booking_ID)) - (SELECT COUNT(b.date_cancelled)), COUNT(b.date_cancelled) AS \"Cancelled Bookings\", SUM(t.amount) as \"Total Sales\", MONTH(t.trans_date) AS \"Month\"" +
                    " FROM bookings b LEFT JOIN transactions t" +
                    "                     ON b.booking_ID = t.booking_ID" +
                    " WHERE YEAR(t.trans_date) = ? AND MONTH(t.trans_date) = ?" +
                    " GROUP BY MONTH(t.trans_date);"
            );
            getGroups.setInt(1, Integer.parseInt(year));
            getGroups.setInt(2, Integer.parseInt(month));
            result = getGroups.executeQuery();
        }  catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
