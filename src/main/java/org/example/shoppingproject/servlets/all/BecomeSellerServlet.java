package org.example.shoppingproject.servlets.all;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.shoppingproject.enums.UserRole;
import org.example.shoppingproject.model.User;
import org.example.shoppingproject.service.UserService;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "becomeSeller",value = "/becomeSeller")
public class BecomeSellerServlet extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer id = (Integer)session.getAttribute("userId");
        userService.becameSeller(id);
        resp.sendRedirect("/profile.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer id = (Integer)session.getAttribute("userId");
        if (id==null) {
            resp.sendRedirect("/main.jsp");
        }else {
            resp.sendRedirect("/profile.jsp");
        }

    }
}

