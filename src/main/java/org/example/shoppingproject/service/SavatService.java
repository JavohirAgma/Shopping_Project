package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Basket;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.repository.ProductRepository;
import org.example.shoppingproject.repository.SavatRepository;

import java.util.List;

public class SavatService {
    private SavatRepository savatRepository;

    public SavatService() {
        this.savatRepository = new SavatRepository();
    }
    public Integer save(Basket basket) {
        return savatRepository.save(basket);
    }
    public List<Basket> findAll(Integer userId) {
        return savatRepository.getAll(userId);
    }

}
