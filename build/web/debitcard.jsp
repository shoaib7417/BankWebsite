<%-- 
    Document   : debitcard
    Created on : 14-May-2024, 12:02:28 pm
    Author     : shoaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Debit Card Application Form</title>
        <link rel="stylesheet" href="debitcard.css">
        <link rel="website icon" type="png"
              href="image/websiteicon.jpg"><!-- comment -->
    </head>
    <body>

        <h2>Debit Card Application Form</h2>

        <form action="/submit_debit_card_form" method="post">

            <fieldset>
                <legend>Personal Information:</legend>
                <label for="fullname">Full Name:</label><br>
                <input type="text" id="fullname" name="fullname" required><br><br>

                <label for="dob">Date of Birth:</label><br>
                <input type="date" id="dob" name="dob" required><br><br>

                <label>Gender:</label><br>
                <input type="radio" id="male" name="gender" value="male">
                <label for="male">Male</label><br>
                <input type="radio" id="female" name="gender" value="female">
                <label for="female">Female</label><br>
                <input type="radio" id="other" name="gender" value="other">
                <label for="other">Other</label><br><br>

                <label for="phone">Contact Number:</label><br>
                <input type="tel" id="phone" name="phone" required><br><br>

                <label for="email">Email Address:</label><br>
                <input type="email" id="email" name="email" required><br><br>
            </fieldset>

            <fieldset>
                <legend>Residential Address:</legend>
                <label for="address">Street Address:</label><br>
                <input type="text" id="address" name="address" required><br><br>

                <label for="city">City:</label><br>
                <input type="text" id="city" name="city" required><br><br>

                <label for="state">State/Province:</label><br>
                <input type="text" id="state" name="state" required><br><br>

                <label for="zip">Zip/Postal Code:</label><br>
                <input type="text" id="zip" name="zip" required><br><br>

                <label for="country">Country:</label><br>
                <input type="text" id="country" name="country" required/><br><br>
            </fieldset>

            <!-- Additional fields for identification, employment, banking details, debit card preferences, and terms and conditions can be added similarly -->

            <input  class="input" type="button" onclick="Alert()" value="Submit" />

        </form>

        <script>
            function generateFourDigitRandomNumber() {
                // Generate a random number between 1000 and 9999
                return Math.floor(Math.random() * 9000) + 1000;
            }

            function Alert() {
                var randomNumber = generateFourDigitRandomNumber(); // Generate the random number

                if (document.getElementById("fullname").value === '')
                {
                    alert('Please fill out all fields');
                } else
                {
                    alert('Form submit successfully and the Debit Card no. is: ' + randomNumber);    
                   
                   window.location.href="debitcard.jsp";     
                }
                
            }
            
        </script>

    </body>
</html>
