package org.example.shoppingproject.servlets.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.shoppingproject.enums.Category;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "createProduct",value = "/createProduct")
public class CreateProductServlet extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        String productDescription = req.getParameter("productDescription");
        String productCategory = req.getParameter("productCategory");
        Integer shopId= Integer.valueOf(req.getParameter("shopId"));
        Product build = Product.builder()
                .name(productName)
                .description(productDescription)
                .category(Category.valueOf(productCategory))
                .photoId("121212")
                .storeId(shopId)
                .build();
        productService.addProduct(build);
        List<Product> allProducts = productService.getAllProducts(Integer.valueOf(shopId));
        req.setAttribute("products",allProducts);
        req.getRequestDispatcher("seller/createProduct.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shopId = req.getParameter("shopId");
        req.setAttribute("shopId", shopId);
        List<Product> allProducts = productService.getAllProducts(Integer.valueOf(shopId));
        req.setAttribute("products",allProducts);
        req.getRequestDispatcher("seller/createProduct.jsp").forward(req,resp);

    }
}