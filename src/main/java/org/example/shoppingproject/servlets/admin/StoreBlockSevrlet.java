package org.example.shoppingproject.servlets.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.model.User;
import org.example.shoppingproject.service.ProductService;
import org.example.shoppingproject.service.ShopService;

import java.io.IOException;


@WebServlet(name = "storeBlock", value = "/storeBlock")
public class StoreBlockSevrlet extends HttpServlet {
    ShopService shopService = new ShopService();
    ProductService productService = new ProductService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin/storeBlock.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String storeId = req.getParameter("storeId");
        if (storeId!=null){
            Store store = shopService.getStore(Integer.valueOf(storeId));
            if (store.isOpen()){
                shopService.isActive(store.getId(), false);
                for (Product product : productService.getAll()) {
                    if (product!=null && product.getStoreId().equals(store.getId())){
                        productService.isOpen(product.getId(),false);
                    }
                }
            } else {
                shopService.isActive(store.getId(),true);
                for (Product product : productService.getAll()) {
                    if (product!=null && product.getStoreId().equals(store.getId())){
                        productService.isOpen(product.getId(),true);
                    }
                }
            }
        }
        resp.sendRedirect("admin/storeBlock.jsp");
    }
}
