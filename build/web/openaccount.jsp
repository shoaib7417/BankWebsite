<%-- 
    Document   : openaccount
    Created on : 13-May-2024, 12:03:16 pm
    Author     : shoaib
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Form</title>
    </head>
    <body>
        <%

            String name = request.getParameter("full_name");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String phoneno = request.getParameter("contact");
            String mail = request.getParameter("mail");
            String account_type = request.getParameter("account_type");
            String aadhaar = request.getParameter("aadhar");
            String amount = request.getParameter("initial_deposit");
            String pannumber = request.getParameter("pannumber");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
                PreparedStatement ps = con.prepareStatement("INSERT INTO customerdetails VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, dob);
                ps.setString(3, address);
                ps.setString(4, phoneno);
                ps.setString(5, mail);
                ps.setString(6, account_type);
                ps.setString(7, aadhaar);
                ps.setInt(8, Integer.parseInt(amount));
                ps.setString(9, pannumber);
                ps.setString(10, password);
                ps.setString(11, cpassword);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<script>");
                    out.println("alert('Account Opened Successfully. Your username is: " + mail + ". Your Password is: " + password + "');");
                    out.println("window.location='bank.html';");
                    out.println("</script>");
                } else {
                    out.println("<script>alert('Failed to Open Account');</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("form.html");
                    rd.include(request, response);
                }

                ps.close();
                con.close();
            } catch (Exception e) {

                out.println(e.getMessage());
            }
            
        %>
    </body>
</html>
