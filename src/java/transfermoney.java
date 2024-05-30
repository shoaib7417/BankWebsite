
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class transfermoney extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String senderName = request.getParameter("senderName");
        String recipientName = request.getParameter("recipientName");
        String SenderaccountNumber = request.getParameter("SenderaccountNumber");
        String RecipientaccountNumber = request.getParameter("RecipientaccountNumber");
        String amountStr = request.getParameter("amount");
        String transferDateStr = request.getParameter("transferDate");
        try {
            double amount = Double.parseDouble(amountStr);

            // Fetch sender's information from the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customerdetails WHERE aadhar = ?");
            ps.setString(1, SenderaccountNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double senderBalance = rs.getDouble("amount");

                if (senderBalance >= amount) {
                    // Deduct amount from sender's account
                    double newBalance = senderBalance - amount;
                    PreparedStatement deductPs = con.prepareStatement("UPDATE customerdetails SET amount = ? WHERE aadhar = ?");
                    deductPs.setDouble(1, newBalance);
                    deductPs.setString(2, SenderaccountNumber);
                    deductPs.executeUpdate();

                    // Insert transfer details into the database
                    PreparedStatement insertTransferPs = con.prepareStatement("INSERT INTO transferdetails (senderName, recipientName, senderAccountNumber, recipientAccountNumber, amount , transferDate) VALUES (?, ?, ?, ?, ? , ?)"
                    );
                    insertTransferPs.setString(1, senderName);
                    insertTransferPs.setString(2, recipientName);
                    insertTransferPs.setString(3, SenderaccountNumber);
                    insertTransferPs.setString(4, RecipientaccountNumber);
                    insertTransferPs.setDouble(5, amount);
                    insertTransferPs.setString(6, transferDateStr);
                    insertTransferPs.executeUpdate();

                    // Simulate successful transfer
                    out.println("<h3>Transfer successful!</h3>");
                    out.println("<p>Amount transferred: $" + amount + "</p>");
                    out.println("<p>Sender's Remaining Balance: $" + newBalance + "</p>");
                } else {
                    out.println("<h3>Insufficient balance in sender's account.</h3>");
                }
            } else {
                out.println("<h3>Sender account not found.</h3>");
            }

            con.close();
        } catch (NumberFormatException e) {
            out.println("<h3>Error: Invalid amount format</h3>");
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }

        out.close();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
}
