<%-- 
    Document   : login
    Created on : 21-May-2024, 8:17:55 pm
    Author     : shoaib
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="website icon" type="png"
              href="image/websiteicon.jpg"><!-- comment -->
        <title>Login Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .body {
                font-family: Arial, sans-serif;
                background-color: ;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 80vh;
            }

            .login-container {
                background-color: lightsteelblue;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                text-align: center;
            }

            .login-container h2 {
                margin-bottom: 20px;
                color: #333;
            }

            .input-group {
                margin-bottom: 15px;
                text-align: left;
            }

            .input-group label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 4px;
                background-color: darkblue;
                color: #ffffff;
                font-size: 16px;
                cursor: pointer;
            }

            button:hover {
                background-color: lightgreen;
            }

            .logo-container {
                height: 130px;
                width: 300px;
                margin-bottom: -45px;
            }

            .logo-container img {
                height: 200px;
                width: 300px;
            }
        </style>
    </head>
    <body>
        <div style="height: 80px; width: 100%;; display: flex;">
            <div style="height: 130px; width: 300px;">
                <img src="image/banklogo1-removebg-preview (1).png" height="200px" width="300px" style="margin-top: -45px;">
            </div>
        </div>
        <div class="body">
            <div class="login-container">
                <h2>Login</h2>
                <form action="login.jsp" method="post">
                    <div class="input-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" required>
                    </div>
                    <button type="submit">Login</button>
                </form>
            </div>
        </div>
        <%
            String email = request.getParameter("username");
            String password = request.getParameter("password");
            if (email != null && password != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM customerdetails WHERE email=? AND password=?");
                    ps.setString(1, email);
                    ps.setString(2, password);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        out.println("<script>");
                        out.println("alert('Account Login Successfully...');");
                        out.println("window.location='bank.html';");
                        out.println("</script>");
                    } else {
                        out.println("<script>alert('Invalid login credentials. Please try again.');</script>");
                    }
                } catch (Exception e) {
                    out.println("<script>alert('An error occurred. Please try again later.');</script>");
                }
            }
        %>
    </body>
</html>
