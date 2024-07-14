package org.example.shoppingproject.servlets.all;

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

@WebServlet(name = "main", value = "/main")
@MultipartConfig
public class MainServlet extends HttpServlet {
    private UserService userService = new UserService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User login = userService.login(username,password);
        if (login!=null) {
            HttpSession session = req.getSession();
            session.setAttribute("userId", login.getId());
            resp.sendRedirect("/main.jsp");
        }else {
            resp.sendRedirect("/login");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/main.jsp");
        requestDispatcher.forward(req,resp);

    }
}
