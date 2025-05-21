<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - Online Book Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="mb-4">Contact Us</h2>
                <% if(request.getAttribute("message") != null) { %>
                    <div class="alert alert-success"><%= request.getAttribute("message") %></div>
                <% } %>
                
                <form action="ContactServlet" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Your Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="subject" class="form-label">Subject</label>
                        <input type="text" class="form-control" id="subject" name="subject" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>
                
                <div class="mt-5">
                    <h4>Our Location</h4>
                    <p>123 Book Street, Literary City, LC 12345</p>
                    <p>Email: info@bookstore.com</p>
                    <p>Phone: (123) 456-7890</p>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>