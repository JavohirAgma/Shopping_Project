package org.example.shoppingproject.repository;

import org.example.shoppingproject.model.Store;

import java.util.List;

public class ShopRepository implements BaseRepository<Store>{
    @Override
    public Integer save(Store store) {
        return 0;
    }

    @Override
    public Store get(Integer id) {
        return null;
    }

    @Override
    public List<Store> getAll() {
        return List.of();
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
