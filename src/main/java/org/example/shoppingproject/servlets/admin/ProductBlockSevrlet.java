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
    ShopService shopService = new ShopService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        if (productId!=null){
            Product product = productService.getProductById(Integer.valueOf(productId));
            Integer storeId = product.getStoreId();
            Store store = shopService.getStore(storeId);
            if (store.isOpen()){
                if (product.isOpen()){
                    productService.isOpen(product.getId(),false);
                } else {
                    productService.isOpen(product.getId(),true);
                }
            }else {
                req.setAttribute("storeName",store.getName());
                req.getRequestDispatcher("admin/noticeForAdmin.jsp").forward(req, resp);
            }
        }
        resp.sendRedirect("admin/productBlock.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin/productBlock.jsp").forward(req,resp);

    }
}
