package org.example.shoppingproject.servlets.all;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.shoppingproject.model.Basket;
import org.example.shoppingproject.service.SavatService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "showBasket" , urlPatterns = "/showBasket")
public class ShowBasket extends HttpServlet {
    SavatService savatService = new SavatService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("showBasket.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object userId = req.getSession().getAttribute("userId");
        Integer payment = savatService.Payment((Integer) userId);
        resp.sendRedirect("showBasket");
    }
}
