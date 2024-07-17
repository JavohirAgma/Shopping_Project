package org.example.shoppingproject.servlets.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.shoppingproject.enums.Category;
import org.example.shoppingproject.model.Image;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.service.ImageService;
import org.example.shoppingproject.service.ProductService;
import org.example.shoppingproject.utils.FileWriterUtil;

import java.io.IOException;
import java.io.InputStream;
import java.util.IdentityHashMap;
import java.util.List;

@WebServlet(name = "createProduct",value = "/createProduct")
@MultipartConfig
public class CreateProductServlet extends HttpServlet {
    ProductService productService = new ProductService();
    ImageService imageService = new ImageService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Part file = req.getPart("file");
        String submittedFileName = file.getSubmittedFileName();
        String type = submittedFileName.substring(submittedFileName.lastIndexOf("."));
        InputStream inputStream = file.getInputStream();
        byte[] bytes = inputStream.readAllBytes();
        String uuid = FileWriterUtil.write(type, bytes);

        String productName = req.getParameter("productName");
        String productDescription = req.getParameter("productDescription");
        String productCategory = req.getParameter("productCategory");
        Integer shopId= Integer.valueOf(req.getParameter("shopId"));
        Product build = Product.builder()
                .name(productName)
                .description(productDescription)
                .category(Category.valueOf(productCategory))
                .storeId(shopId)
                .photoId(uuid)
                .build();

        Integer i = productService.addProduct(build);


        Image image = Image.builder()
                .uuid(uuid)
                .name(submittedFileName)
                .productId(i)
                .type(type)
                .build();

        imageService.save(image);

        List<Product> allProducts = productService.getAllProducts(Integer.valueOf(shopId));
        req.setAttribute("products",allProducts);
        req.setAttribute("shopId", shopId);
        req.getRequestDispatcher("seller/createProduct.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shopId = req.getParameter("shopId");
        req.setAttribute("shopId", shopId);
        req.getRequestDispatcher("seller/createProduct.jsp").forward(req,resp);

    }
}