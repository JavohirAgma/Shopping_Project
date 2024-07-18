package org.example.shoppingproject.servlets.all;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.shoppingproject.model.Basket;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.service.ProductService;
import org.example.shoppingproject.service.SavatService;

import javax.management.remote.NotificationResult;
import java.io.IOException;

@WebServlet(name = "addSavat",value = "/addSavat")
public class AddSavatServlet extends HttpServlet {
    SavatService savatService = new SavatService();
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String name = req.getParameter("name");
        String desc = req.getParameter("desc");
        Integer price = Integer.valueOf(req.getParameter("price"));
        Integer count = Integer.valueOf(req.getParameter("count"));
        Integer storeId = Integer.valueOf(req.getParameter("storeId"));
        Product product = Product.builder()
                .id(id)
                .name(name)
                .description(desc)
                .price(price)
                .count(count)
                .storeId(storeId)
                .build();
        req.setAttribute("product",product);
        req.getRequestDispatcher("addSavat.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer count = Integer.valueOf(req.getParameter("count"));
        HttpSession httpSession = req.getSession();
        Object userId = httpSession.getAttribute("userId");
        Integer id = Integer.valueOf(req.getParameter("id"));
        Integer price = Integer.valueOf(req.getParameter("price"));
        Integer storeId = Integer.valueOf(req.getParameter("storeId"));
        Basket build = Basket.builder()
                .userId((Integer) userId)
                .productId(id)
                .storeId(storeId)
                .countOfProduct(count)
                .productSum(price)
                .build();
        savatService.save(build);
        productService.updateCount(id,count);
        resp.sendRedirect("/main.jsp");
    }
}
