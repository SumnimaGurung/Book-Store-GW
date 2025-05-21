<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        /* Footer Styles */
        footer {
            background-color: #34495e;
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 1.5rem;
        }
        .footer-links a {
            color: white;
            text-decoration: none;
        }
        .footer-links a:hover {
            text-decoration: underline;
        }
        .contact-info {
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        .newsletter input {
            padding: 0.5rem;
            width: 250px;
            border: none;
            border-radius: 4px 0 0 4px;
        }
        .newsletter button {
            padding: 0.5rem 1rem;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        .copyright {
            margin-top: 1.5rem;
            font-size: 0.9rem;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <footer>
        
        <div class="contact-info">
            <p>123 Book Street, Literary City, LC 56789</p>
            <p>+1-234-567-890</p>
            <p>contact@bookhaven.com</p>
        </div>
        
        <div class="newsletter">
            <input type="email" placeholder="Your email address">
            <button>Sign Up</button>
        </div>
        
        <div class="copyright">
            ©️ 2024 BookHaven. All rights reserved. 
        </div>
    </footer>
</body>
</html>