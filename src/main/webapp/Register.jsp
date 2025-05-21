<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookHaven - Register</title>
    <style>
        /* Main Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .register-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .register-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .register-header h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .register-header p {
            color: #7f8c8d;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s;
        }

        .form-control:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .btn-register {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-register:hover {
            background-color: #2980b9;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #7f8c8d;
        }

        .login-link a {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
        }

        .response-message {
            text-align: center;
            margin-bottom: 15px;
            font-size: 15px;
            font-weight: 500;
        }

        .response-message.error {
            color: #e74c3c;
        }

        .response-message.success {
            color: green;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="register-container">
        <div class="register-header">
            <h2>Create Your Account</h2>
            <p>Join BookHaven to start your reading journey</p>
        </div>

        <!-- Display error or success messages from backend -->
        <%
            String error = request.getParameter("error");
            String message = request.getParameter("message");
            if (error != null) {
        %>
            <div class="response-message error"><%= error %></div>
        <%
            } else if (message != null) {
        %>
            <div class="response-message success"><%= message %></div>
        <%
            }
        %>

       <form id="registerForm" action="<%=request.getContextPath() %>/Register" method="post" onsubmit="return validateForm()">
    <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" class="form-control" id="name" name="name" required>
        <div id="nameError" class="error-message"></div>
    </div>

    <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" class="form-control" id="email" name="email" required>
        <div id="emailError" class="error-message"></div>
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password" required>
        <div id="passwordError" class="error-message"></div>
    </div>

    <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        <div id="confirmError" class="error-message"></div>
    </div>

    <div class="form-group">
        <label for="address">Address</label>
        <input type="text" class="form-control" id="address" name="address" required>
        <div id="addressError" class="error-message"></div>
    </div>

    <button type="submit" class="btn-register">Register</button>
</form>


    <%@ include file="footer.jsp" %>

    <script>
        function validateForm() {
            document.getElementById('nameError').textContent = '';
            document.getElementById('emailError').textContent = '';
            document.getElementById('passwordError').textContent = '';
            document.getElementById('confirmError').textContent = '';

            const fullName = document.getElementById('fullName').value.trim();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            let isValid = true;

            if (fullName.length < 3) {
                document.getElementById('nameError').textContent = 'Name must be at least 3 characters';
                isValid = false;
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').textContent = 'Please enter a valid email address';
                isValid = false;
            }

            if (password.length < 6) {
                document.getElementById('passwordError').textContent = 'Password must be at least 6 characters';
                isValid = false;
            }

            if (password !== confirmPassword) {
                document.getElementById('confirmError').textContent = 'Passwords do not match';
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>
