package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.repository.ShopRepository;

import java.util.List;

public class ShopService {
    private ShopRepository shopRepository;
    public ShopService() {
        this.shopRepository = new ShopRepository();
    }

    public Integer addStore(Store store) {
        return shopRepository.save(store);
    }
    public Store getStore(Integer id) {
        return shopRepository.get(id);
    }
    public List<Store> getStoresWithUserId(Integer id) {
        return shopRepository.getStoreByUserId(id);
    }
    public String findName(Integer id) {
        return shopRepository.findName(id);
    }
    public boolean isActive(Integer id , boolean active){
        return shopRepository.setIsActive(id,active);
    }
    public List<Store> getAll(){
        return shopRepository.getAll();
    }
}
