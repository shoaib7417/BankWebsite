<%-- 
    Document   : UPI
    Created on : 16-May-2024, 11:38:01 am
    Author     : shoaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BHIM Application Form</title>
        <link rel="stylesheet" href="UPI.css">
        <link rel="website icon" type="png"
              href="image/websiteicon.jpg"><!-- comment -->
    </head>
    <link href="UPI.css" rel="stylesheet" type="text/css"/>
    <body>
        <div class="container">
            <h2>BHIM Application Form</h2>
            <form action="#" method="post">
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required>

                <label for="bank">Bank Name:</label>
                <input type="text" id="bank" name="bank" required>

                <label for="account">Account Number:</label>
                <input type="text" id="account" name="account" required>

                <label for="ifsc">IFSC Code:</label>
                <input type="text" id="ifsc" name="ifsc" required>

                <button type="button" onclick="Alert()" value="Submit">Submit</button>
            </form>
        </div>
        <script>
            
                function Alert() {

                if (document.getElementById("fullname").value === '')
                {
                    alert('Please fill out all fields');
                } else
                {
                    alert('Form submit successfully');    
                   
                   window.location.href="UPI.jsp";     
                }
                
            }
            
        </script>
    </body>
</html>

