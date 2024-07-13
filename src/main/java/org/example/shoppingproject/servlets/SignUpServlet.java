package org.example.shoppingproject.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.shoppingproject.enums.UserRole;
import org.example.shoppingproject.model.User;
import org.example.shoppingproject.service.UserService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "signup", value = "/signup")
public class SignUpServlet extends HttpServlet {
    private UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getMethod());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/signup.jsp");
        requestDispatcher.forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phoneNumber = req.getParameter("phone_number");
        UserRole category = UserRole.getCategoryByOrdinal(1);
        List<UserRole> userRoles = new ArrayList<UserRole>();
        userRoles.add(category);
        User build = User.builder()
                .name(name)
                .password(password)
                .isActive(true)
                .phone(phoneNumber)
                .email(email)
                .userName(username)
                .role(userRoles)
                .build();
        userService.signUp(build);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/congrats.jsp");
        requestDispatcher.forward(req,resp);
        ;
    }
}
