package org.example.shoppingproject.servlets.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.service.ShopService;

import java.io.IOException;

@WebServlet(name = "createShop",value = "/createShop")
public class CreateShopServlet extends HttpServlet {
    private ShopService shopService = new ShopService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("createShop.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String name = req.getParameter("name");
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        System.out.println(name);
        Store build = Store.builder().name(name).ownerId((Integer) userId).build();
        shopService.addStore(build);
        resp.sendRedirect("createShop.jsp");
    }
}
