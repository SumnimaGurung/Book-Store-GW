<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0b355b; /* Deep Blue */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 30px;
        }

        .settings-wrapper {
            background: white;
            width: 100%;
            max-width: 400px;
            border-radius: 20px;
            padding: 25px 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .settings-header {
            text-align: center;
            font-weight: bold;
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .setting-section {
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .setting-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 16px;
            border-bottom: 1px solid #eee;
            color: #333;
            background: #fff;
            font-size: 15px;
            cursor: pointer;
        }

        .setting-item:last-child {
            border-bottom: none;
        }

        .setting-item:hover {
            background: #f5f5f5;
        }

        .signout-btn {
            background: #fff;
            color: #e74c3c;
            padding: 12px 16px;
            font-weight: bold;
            text-align: center;
            border-top: 1px solid #eee;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .signout-btn:hover {
            background: #ffeaea;
        }

        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>

<div class="settings-wrapper">
    <div class="settings-header">Settings</div>

    <div class="setting-section">
        <a href="Profile.jsp"><div class="setting-item">Account Setting</div></a>
        <div class="setting-item"> Privacy</div>
        <div class="setting-item"> Notifications</div>
    </div>

    <div class="setting-section">
        <div class="setting-item"> Share with Friends</div>
        <div class="setting-item"> Feedback</div>
        <div class="setting-item"> Help</div>
        <div class="setting-item"> Contact</div>
    </div>

    <div class="setting-section">
        <div class="setting-item"> Terms of Service</div>
        <div class="setting-item">Privacy Policy</div>
    </div>

    <a href="logout.jsp"><div class="signout-btn"> Sign Out</div></a>
</div>

</body>
</html>