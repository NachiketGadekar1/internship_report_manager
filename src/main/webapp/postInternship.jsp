<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Internship Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }

        .report-container {
            background: white;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 40px auto;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.2em;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        textarea {
            height: 200px;
            resize: vertical;
            min-height: 150px;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 30px auto 0;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #428bca;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        input[type="text"]:focus, textarea:focus {
            outline: none;
            border-color: #5cb85c;
            box-shadow: 0 0 5px rgba(92, 184, 92, 0.2);
        }

        .instructions {
            color: #666;
            text-align: center;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
    <div class="report-container">
        <h1>Create Internship Report</h1>
        <p class="instructions">Please fill in the details of your internship report below.</p>
        
        <form action="SubmitInternshipReport" method="post">
            <div class="form-group">
                <label for="title">Report Title:</label>
                <input type="text" id="title" name="title" required 
                       placeholder="Enter a descriptive title for your report">
            </div>
            
            <div class="form-group">
                <label for="description">Report Description:</label>
                <textarea id="description" name="description" required
                          placeholder="Provide detailed information about your internship activities, learnings, and achievements"></textarea>
            </div>
            
            <input type="submit" value="Submit Report">
        </form>
        
        <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</body>
</html>