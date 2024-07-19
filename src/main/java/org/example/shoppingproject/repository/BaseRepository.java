package org.example.shoppingproject.repository;

import org.example.shoppingproject.model.User;

import java.util.List;

public interface BaseRepository<M>{

    Integer save(M m);
    M get(Integer id);
    List<M> getAll();
    boolean delete(Integer id);
}
