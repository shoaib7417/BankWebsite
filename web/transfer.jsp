<%-- 
    Document   : transfer
    Created on : 20-May-2024, 11:01:06 am
    Author     : shoaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Money Transfer Form</title>
        <link rel="stylesheet" href="transfer.css">
    </head>
    <body>
        <div class="container">
            <h2>Money Transfer</h2>
            <form action="transfermoney">
                <label for="senderName">Sender Name:</label>
                <input type="text" id="senderName" name="senderName" required>

                <label for="recipientName">Recipient Name:</label>
                <input type="text" id="recipientName" name="recipientName" required>

                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required>

                <label for="accountNumber">Sender Account Number:</label>
                <input type="number" id="accountNumber" name="SenderaccountNumber" required>
                
                <label for="accountNumber">Recipient Account Number:</label>
                <input type="number" id="accountNumber" name="RecipientaccountNumber" required>

                <label for="transferDate">Transfer Date:</label>
                <input type="date" id="transferDate" name="transferDate" required>

                <button type="submit">Transfer Money</button>
            </form>
        </div>
    </body>
</html>

