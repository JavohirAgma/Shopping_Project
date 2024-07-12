package org.example.shoppingproject.repository;

import java.util.List;

public interface BaseRepository<M>{

    Integer save(M m);
    M get(Integer id);
    List<M> getAll();
    boolean delete(Integer id);
}
