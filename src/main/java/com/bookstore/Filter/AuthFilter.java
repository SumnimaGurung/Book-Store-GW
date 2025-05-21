package com.bookstore.Filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {"/home.jsp", "/cart.jsp", "/profile.jsp"}) // Add protected pages here
public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        if (!loggedIn) {
            res.sendRedirect("login.jsp?error=Please login first.");
        } else {
            chain.doFilter(request, response); // Continue to requested resource
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {}
    public void destroy() {}
}
