package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/SubmitInternshipReport")
public class SubmitInternshipReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        // Get the form data
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        // Retrieve the username from the session
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        // Check if the user is logged in
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report_management", "root", "12345");
            
            // Insert report into the database
            String query = "INSERT INTO internship_reports (uname, title, description) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, title);
            ps.setString(3, description);
            
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h3>Report submitted successfully!</h3>");
                out.println("<a href='dashboard.jsp'>Go back to dashboard</a>");
            } else {
                out.println("<h3>Error submitting report.</h3>");
                out.println("<a href='createReport.jsp'>Try again</a>");
            }
            
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
