<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Internship Dashboard</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #5cb85c;
            --accent-color: #f39c12;
            --text-color: #333;
            --bg-color: #f4f4f4;
        }

        body {
            font-family: Arial, sans-serif;
            background: var(--bg-color);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        .navbar {
            background: var(--primary-color);
            padding: 1rem 2rem;
            color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .navbar-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: transform 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-icon {
            background: var(--primary-color);
            padding: 1rem;
            border-radius: 8px;
            color: white;
        }

        .stat-info h3 {
            margin: 0;
            font-size: 0.9rem;
            color: #666;
        }

        .stat-info p {
            margin: 5px 0 0 0;
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--text-color);
        }

        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .action-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.2s;
        }

        .action-card:hover {
            transform: translateY(-5px);
        }

        .action-icon {
            background: #f8f9fa;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
        }

        .action-title {
            font-size: 1.2rem;
            color: var(--text-color);
            margin-bottom: 1rem;
        }

        .action-description {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }

        .action-button {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-weight: 500;
        }

        .action-button:hover {
            background-color: #357abd;
        }

        .action-button.create {
            background-color: var(--secondary-color);
        }

        .action-button.create:hover {
            background-color: #4cae4c;
        }

        .recent-activity {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-top: 2rem;
        }

        .activity-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .activity-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .activity-item {
            padding: 1rem 0;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            color: var(--primary-color);
        }

        .activity-content {
            flex: 1;
        }

        .activity-title {
            margin: 0;
            color: var(--text-color);
            font-weight: 500;
        }

        .activity-time {
            font-size: 0.9rem;
            color: #666;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-content">
            <div class="logo">Internship report manager</div>
            <div class="user-info">
                <i class="fas fa-user-circle" width="24" height="24"></i>
                <span id="welcome-message">Welcome, User</span>
            </div>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="actions-grid">
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-file-plus" width="24" height="24"></i>
                </div>
                <h2 class="action-title">Create New Report</h2>
                <p class="action-description">Start a new internship report. Document your progress, achievements, and learning experiences.</p>
                <a href='postInternship.jsp' class="action-button create">Create Report</a>
            </div>
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-files" width="24" height="24"></i>
                </div>
                <h2 class="action-title">View Reports</h2>
                <p class="action-description">Access and manage all your internship reports. Track your progress and review past submissions.</p>
                <a href="ViewReportsServlet" class="action-button">View Reports</a>
            </div>
        </div>
    </div>

    <script>
        // Retrieve username from sessionStorage
        const username = sessionStorage.getItem('username') || 'User'; // Fallback to 'User' if not found
        document.getElementById('welcome-message').textContent = `Welcome, ${username}`;
    </script>
</body>
</html>