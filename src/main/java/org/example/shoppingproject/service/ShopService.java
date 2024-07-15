package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.repository.ShopRepository;

import java.util.List;

public class ShopService {
    private ShopRepository shopRepository;
    public ShopService() {
        this.shopRepository = new ShopRepository();
    }
    public Store addStore(Store store) {
        return null;
    }
    public Store getStore(Integer id) {
        return null;
    }
    public List<Store> getStoresWithUserId(Integer id) {
        return null;
    }
}
