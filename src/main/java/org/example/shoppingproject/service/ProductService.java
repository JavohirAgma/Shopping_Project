package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.repository.ProductRepository;
import org.example.shoppingproject.repository.ShopRepository;

import java.util.List;

public class ProductService {
    private ProductRepository productRepository;

    public ProductService() {
        this.productRepository = new ProductRepository();
    }
    public Integer addProduct(Product product) {
        return productRepository.save(product);
    }
    public List<Product> getAllProducts(Integer storeId) {
        return productRepository.getAll(storeId);
    }
    public  List<Product> getAll() {
        return productRepository.getAll();
    }
    public Product getProductById(Long id) {
        return null;
    }


}
