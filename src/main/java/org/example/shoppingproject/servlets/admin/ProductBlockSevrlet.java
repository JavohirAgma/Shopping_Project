package org.example.shoppingproject.servlets.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.service.ProductService;
import org.example.shoppingproject.service.ShopService;

import java.io.IOException;

@WebServlet(name = "productBlock", value = "/productBlock")
public class ProductBlockSevrlet extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin/productBlock.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        if (productId!=null){
            Product product = productService.getProductById(Integer.valueOf(productId));
            if (product.isOpen()){
                productService.isOpen(product.getId(),false);
            } else {
                productService.isOpen(product.getId(),true);
            }
        }
        resp.sendRedirect("admin/productBlock.jsp");
    }
}
