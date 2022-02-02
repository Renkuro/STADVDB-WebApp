<%-- 
    Document   : insert
    Created on : Dec 12, 2019, 8:49:09 AM
    Author     : Luis Angelo
--%>
<%@page import = "CCINFOM.*, java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert a Record</title>
    </head>
    <body>
        <h1>Insert a Record</h1>
        <p><table border="1">
            <tbody>
                <tr>
                    <td><%= request.getParameter("username")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("last_name")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("first_name")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("password")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("gender")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("bday")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("contact_no")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("address")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("EM_name")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("EM_address")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("EM_contact_no")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("country")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("status")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("reject_reason")%></td>
                </tr>
                <tr>
                    <td><%= request.getParameter("TO_username")%></td>
                </tr>
            </tbody>
        </table>
    </p>
    </body>
</html>
