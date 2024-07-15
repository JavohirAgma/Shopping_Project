package org.example.shoppingproject.repository;

import jakarta.servlet.http.HttpSession;
import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.enums.UserRole;
import org.example.shoppingproject.model.Store;
import org.example.shoppingproject.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ShopRepository implements BaseRepository<Store>{
    @Override
    public Integer save(Store store) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){

            String query = "insert into stores(name,ownerId,isOpen) values('%s',%s,%s) returning id;"
                    .formatted(store.getName(),store.getOwnerId(),true);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                int id = rs.getInt("id");
                return id;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
    public List<Store> getStoreByUserId(Integer id) {
        List<Store> storeList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from stores where ownerId = %s"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                Integer ownerId = rs.getInt("ownerId");
                Boolean isOpen = rs.getBoolean("isOpen");
                Store build = Store.builder()
                        .id(id1)
                        .name(name)
                        .ownerId(ownerId)
                        .isOpen(isOpen)
                        .build();
                storeList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return storeList;
    }
}
