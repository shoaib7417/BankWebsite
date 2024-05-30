<%-- 
    Document   : estatement
    Created on : 16-May-2024, 10:27:38 pm
    Author     : shoaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="website icon" type="png"
              href="image/websiteicon.jpg"><!-- comment -->
        <title>e-statement</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: lightsteelblue;
                color: #343a40;
            }
            table {
                width: 80%;
                border-collapse: collapse;
                margin: 20px auto;
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #dee2e6;
            }
            th {
                background-color: #007bff;
                color: #ffffff;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e9ecef;
            }
            h1 {
                text-align: center;
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <h1>E- statement</h1>
    <center>
        <table border="2">
            <thead>
                <tr>
                    <th>Sender Name</th>
                    <th>Recipient Name</th>
                    <th>Sender Account Number</th>
                    <th>Recipient Account Number</th>
                    <th>Amount</th>
                    <th>Transfer Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM transferdetails");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("senderName")%></td>
                    <td><%= rs.getString("recipientName")%></td>
                    <td><%= rs.getString("senderAccountNumber")%></td>
                    <td><%= rs.getString("recipientAccountNumber")%></td>
                    <td><%= rs.getDouble("amount")%></td>
                    <td><%= rs.getDate("transferDate")%></td>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='6'>" + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </center>
</body>
</html>
