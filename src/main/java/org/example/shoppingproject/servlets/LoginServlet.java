package org.example.shoppingproject.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.shoppingproject.model.User;
import org.example.shoppingproject.service.UserService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "login", value = "/login")
@MultipartConfig
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User login = userService.login(username, password);

            HttpSession session = req.getSession();
            session.setAttribute("userId",login.getId());
            resp.sendRedirect("/login.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("login "+req.getMethod());
        String today = LocalDate.now().toString();
        req.setAttribute("today",today);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/login.jsp");
        requestDispatcher.forward(req,resp);
    }
}