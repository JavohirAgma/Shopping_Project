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
import org.example.shoppingproject.service.UserService;

import java.io.IOException;

@WebServlet(name = "userBlock" , value = "/userBlock")
public class UsersBlockSevrlet extends HttpServlet {
    UserService userService = new UserService();
    ShopService shopService = new ShopService();
    ProductService productService = new ProductService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin/userBlock.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        if (userId!=null){
            User user = userService.get(Integer.valueOf(userId));
            if (user.getIsActive()){
                userService.setIsActive(user.getId(), false);
                for (Store store : shopService.getStoresWithUserId(user.getId())) {
                    if (store!=null){
                        shopService.isActive(store.getId(),false);
                        for (Product product : productService.getAllIsActive()) {
                            if (product!=null && product.getStoreId().equals(store.getId())){
                                productService.isOpen(product.getId(),false);
                            }
                        }
                    }
                }
            } else {
                userService.setIsActive(user.getId(), true);
                for (Store store : shopService.getStoresWithUserId(user.getId())) {
                    if (store!=null){
                        shopService.isActive(store.getId(),true);
                        for (Product product : productService.getAllIsActive()) {
                            if (product!=null && product.getStoreId().equals(store.getId())){
                                productService.isOpen(product.getId(),true);
                            }
                        }
                    }
                }
            }
        }
        resp.sendRedirect("admin/userBlock.jsp");
    }
}
