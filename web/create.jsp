<%-- 
    Document   : create
    Created on : Dec 12, 2019, 8:43:37 AM
    Author     : Luis Angelo
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a Record</title>
    </head>
    <body onload="displayResults()">
        <h1>Create a Record</h1>
        <%
            int result = 0;
            Client client = new Client();
            if(request.getParameter("submit") != null) {
                String username = new String();
                String last_name = new String();
                String first_name = new String();
                String password = new String();
                String gender = new String();
                String bday = new String();
                String contact_no = new String();
                String address = new String();
                String EM_name = new String();
                String EM_address = new String();
                String EM_contact_no = new String();
                String country = new String();
                String status = new String();
                String reject_reason = new String();
                String TO_username = new String();
                
                if(request.getParameter("username") != null) {
                    username = request.getParameter("username");
                }
                
                if(request.getParameter("last_name") != null) {
                    last_name = request.getParameter("last_name");
                }
                    
                if(request.getParameter("first_name") != null){
                    first_name = request.getParameter("first_name");
                }
                    
                if(request.getParameter("password") != null) {
                    password = request.getParameter("password");
                }
                    
                if(request.getParameter("gender") != null) {
                    gender = request.getParameter("gender");
                }
                    
                if(request.getParameter("bday") != null) {
                    bday = request.getParameter("bday");
                }
                    
                if(request.getParameter("contact_no") != null) {
                    contact_no = request.getParameter("contact_no");
                }
                    
                if(request.getParameter("address") != null) {
                    address = request.getParameter("address");
                }
                    
                if(request.getParameter("EM_name") != null) {
                    EM_name = request.getParameter("EM_name");
                }
                    
                if(request.getParameter("EM_address") != null) {
                    EM_address = request.getParameter("EM_address");
                }
                    
                if(request.getParameter("EM_contact_no") != null) {
                    EM_contact_no = request.getParameter("EM_contact_no");
                }
                    
                if(request.getParameter("country") != null) {
                    country = request.getParameter("country");
                }
                    
                if(request.getParameter("status") != null) {
                    status = request.getParameter("status");
                }
                
                if(request.getParameter("reject_reason") != null) {
                    reject_reason = request.getParameter("reject_reason");
                }
                    
                if(request.getParameter("TO_username") != null) {
                    TO_username = request.getParameter("TO_username");
                }
                
                result = client.setClient(username, last_name, first_name, password, gender, bday, contact_no, address, EM_name, EM_address, EM_contact_no, country, status, reject_reason, TO_username);
            }
        %>
        <form name="myForm" action="create.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Username : </td>
                        <td><input type="text" name="username" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name : </td>
                        <td><input type="text" name="last_name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>First Name : </td>
                        <td><input type="text" name="first_name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Password : </td>
                        <td><input type="password" name="password" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Gender : </td>
                        <td><select name="gender">
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Birthday : </td>
                        <td><input type="text" name="bday" value="2019-01-01" size="12" /></td>
                    </tr>
                    <tr>
                        <td>Contact # : </td>
                        <td><input type="text" name="contact_no" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Address : </td>
                        <td><input type="text" name="address" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Emergency Contact Name : </td>
                        <td><input type="text" name="EM_name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Emergency Contact Address : </td>
                        <td><input type="text" name="EM_address" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Emergency Contact # : </td>
                        <td><input type="text" name="EM_contact_no" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Nationality : </td>
                        <td><input type="text" name="country" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Status : </td>
                        <td><select name="status">
                                <option value="A">Approved</option>
                                <option value="P">Pending</option>
                                <option value="D">Denied</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Disapproval Reason : </td>
                        <td><input type="text" name="reject_reason" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Travel Officer : </td>
                        <td><input type="text" name="TO_username" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
            <input type="hidden" name="hidden" value="<%= result%>" />
        </form>
            <a href="homepage.html">Back</a>
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
