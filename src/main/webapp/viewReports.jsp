<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .report-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .report-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            transition: transform 0.2s;
        }
        .report-card:hover {
            transform: scale(1.05);
        }
        .report-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0 0 10px;
            color: #007BFF;
        }
        .report-description {
            font-size: 14px;
            margin: 0 0 10px;
            color: #555;
        }
        .report-date {
            font-size: 12px;
            color: #888;
            text-align: right;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <h1>Your Internship Reports</h1>
    <div class="report-container">
        <%
            // Get the session and username
            String username = (String) session.getAttribute("username");
            if (username == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Database connection
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/report_management", "root", "12345");
                ps = con.prepareStatement("SELECT * FROM internship_reports WHERE uname = ?");
                ps.setString(1, username);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Timestamp submissionDate = rs.getTimestamp("submission_date");
        %>
                    <div class="report-card">
                        <h2 class="report-title"><%= title %></h2>
                        <p class="report-description"><%= description %></p>
                        <p class="report-date">Submitted on: <%= submissionDate %></p>
                    </div>
        <%
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<p>Error retrieving reports</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (ps != null) try { ps.close(); } catch (SQLException e) {}
                if (con != null) try { con.close(); } catch (SQLException e) {}
            }
        %>
    </div>
    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
