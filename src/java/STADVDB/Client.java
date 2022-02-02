/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CCINFOM;
import java.sql.*;

public class Client {
    public String url = "jdbc:mysql://localhost:3307/transportdb";
    public String username = "root";
    public String password = "p@ssword";
    
    public PreparedStatement getClients = null;
    public PreparedStatement insertClient = null;
    public PreparedStatement deleteClient = null;
    public PreparedStatement updateClient = null;
    public ResultSet result = null;
    public Connection connection;
    
    
    public Client() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ResultSet getClients() {
        try {
            getClients = connection.prepareStatement("SELECT * FROM clientusers");
            result = getClients.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
            
        }
        return result;
    }
    
    public ResultSet getClients(String username) {
        try {
            getClients = connection.prepareStatement(
                    " SELECT *" + 
                    " FROM clientusers" + 
                    " WHERE username = ?");
            getClients.setString(1, username);
            result = getClients.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public ResultSet getDeletableClients() {
        try {
            getClients = connection.prepareStatement("SELECT * FROM clientusers c WHERE c.username NOT IN (SELECT b.username FROM BOOKINGS b)");
            result = getClients.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
            
        }
        return result;
    }
    
    public int setClient(
                String username,
                String last_name,
                String first_name,
                String password,
                String gender,
                String bday,
                String contact_no,
                String address,
                String EM_name,
                String EM_address,
                String EM_contact_no,
                String country,
                String status,
                String reject_reason,
                String TO_username) {
                    
        int result = 0;

        try {
            insertClient = connection.prepareStatement(
                                "INSERT INTO clientusers VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            insertClient.setString(1, username);
            insertClient.setString(2, last_name);
            insertClient.setString(3, first_name);
            insertClient.setString(4, password);
            insertClient.setString(5, gender);
            insertClient.setDate(6, Date.valueOf(bday));
            insertClient.setString(7, contact_no);
            insertClient.setString(8, address);
            insertClient.setString(9, EM_name);
            insertClient.setString(10, EM_address);
            insertClient.setString(11, EM_contact_no);
            insertClient.setString(12, country);
            insertClient.setString(13, status);
            insertClient.setString(14, reject_reason);
            insertClient.setString(15, TO_username);

            result = insertClient.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public int deleteClient (String username) {
        int result = 0;
        try {
            deleteClient = connection.prepareStatement(
                    "DELETE FROM clientusers WHERE username = ?"
            );
            deleteClient.setString(1, username);
            result = deleteClient.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public ResultSet getPendingClients() {
        try {
            String pending = new String();
            pending = "P";
            getClients = connection.prepareStatement(
                    " SELECT *" +
                    " FROM clientusers" +
                    " WHERE status = ?"
            );
            getClients.setString(1, pending);
            result = getClients.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public int approveClient(String username) {
        int result = 0;
        try {
            updateClient = connection.prepareStatement(
                    " UPDATE clientusers c" +
                    " SET c.status = 'A'" +
                    " WHERE c.username = ?"
            );
            updateClient.setString(1, username);
            result = updateClient.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public int denyClient(String username) {
        int result = 0;
        try {
            updateClient = connection.prepareStatement(
                    " UPDATE clientusers c" +
                    " SET c.status = 'D'" +
                    " WHERE c.username = ?"
            );
            updateClient.setString(1, username);
            result = updateClient.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public ResultSet clientReport (String year, String month) {
        try {
            getClients = connection.prepareStatement(
                    " SELECT     nationality, count(c.username)" +
                    " FROM       clientusers c JOIN bookings b" +
                    "                     ON c.username = b.username" +
                    " WHERE      year(b.date) = ? AND month(b.date) = ?" +
                    " GROUP BY	nationality;"
            );
            getClients.setInt(1, Integer.parseInt(year));
            getClients.setInt(2, Integer.parseInt(month));
            result = getClients.executeQuery();
        }  catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}



