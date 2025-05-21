package com.bookstore.Controller;

import com.bookstore.Model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<Book> cart = (List<Book>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            double price = Double.parseDouble(request.getParameter("price"));

            Book book = new Book(title, author, price);  // Make sure this constructor exists
            cart.add(book);
            session.setAttribute("cart", cart);

        } else if ("remove".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < cart.size()) {
                cart.remove(index);
            }
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
