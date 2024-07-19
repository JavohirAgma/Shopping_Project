package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.repository.ProductRepository;

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
    public  List<Product> getAllIsActive() {
        return productRepository.getAllIsActive();
    }
    public Product getProductById(Integer id) {
        return productRepository.getProductById(id);
    }
    public boolean updateCountDec(Integer prductId, Integer count) {
        return productRepository.updateCountDec(prductId, count);
    }
    public boolean updateCountInc(Integer prductId, Integer count) {
        return productRepository.updateCountInc(prductId, count);
    }
    public String findNameById(Integer id) {
        return productRepository.findName(id);
    }
    public boolean isOpen(Integer id, boolean open){
        return productRepository.setIsOpen(id,open);
    }
    public List<Product> getAll(){
        return productRepository.getAll();
    }
}
