<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect("login.jsp");
    }

    String firstName = "", lastName = "", email = "", phone = "", dob = "", gender = "";
    try {
        Class.forName("com.mysql.jdbc.Driver"); // or com.mysql.cj.jdbc.Driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            firstName = rs.getString("first_name");
            lastName = rs.getString("last_name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            dob = rs.getString("dob");
            gender = rs.getString("gender");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0b355b;
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .profile-wrapper {
            background: white;
            width: 100%;
            max-width: 400px;
            border-radius: 30px 30px 0 0;
            padding: 30px 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .top-image {
            background: linear-gradient(135deg, #a83279, #d38312);
            height: 100px;
            border-radius: 30px 30px 0 0;
            position: relative;
        }

        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 4px solid white;
            position: absolute;
            top: 40px;
            left: 50%;
            transform: translateX(-50%);
        }

        h2 {
            text-align: center;
            margin-top: 80px;
            color: #333;
        }

        form {
            margin-top: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 14px;
        }

        .btn-password {
            display: block;
            margin: 25px auto 0;
            background: #0b355b;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 25px;
            width: 100%;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-password:hover {
            background: #07223b;
        }
    </style>
</head>
<body>

<div class="profile-wrapper">
    <div class="top-image"></div>
    <img src="https://i.pravatar.cc/100" class="profile-pic" alt="Profile Picture" />

    <h2>Edit Profile</h2>

    <form action="UpdateProfileServlet" method="post">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" name="first_name" value="<%= firstName %>" required />
        </div>

        <div class="form-group">
            <label>Last Name</label>
            <input type="text" name="last_name" value="<%= lastName %>" required />
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" value="<%= username %>" readonly />
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="<%= email %>" required />
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phone" value="<%= phone %>" placeholder="+234..." />
        </div>

        <div class="form-group">
            <label>Birth</label>
            <input type="date" name="dob" value="<%= dob %>" />
        </div>

        <div class="form-group">
            <label>Gender</label>
            <select name="gender">
                <option value="">Select</option>
                <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <button class="btn-password" type="submit">Save Changes</button>
    </form>
</div>

</body>
</html>