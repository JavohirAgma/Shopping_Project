package org.example.shoppingproject.servlets.all;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.shoppingproject.service.ProductService;
import org.example.shoppingproject.service.SavatService;

import java.io.IOException;

@WebServlet(name = "delteBasketItem" , value = "/delteBasketItem")
public class ForDeleteItemInBasket extends HttpServlet {
    SavatService savatService = new SavatService();
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer productId = Integer.valueOf(req.getParameter("productId"));
        Integer productCount = Integer.valueOf(req.getParameter("productCount"));
        savatService.deleteBasketItem(productId);
        productService.updateCountInc(productId,productCount);
        resp.sendRedirect("/showBasket");
    }
}
