package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.model.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class ProductRepository implements BaseRepository<Product>{
    @Override
    public Integer save(Product product) {
//        try (
//                Connection connection = DbConnection.getConnection();
//                Statement statement = connection.createStatement();
//        ){
//            String query = "insert into products(name,gmail,password,username,phone_number,is_active) values('%s','%s','%s','%s','%s',%s) returning id;"
//                    .formatted(user.getName(),user.getEmail(),user.getPassword(),user.getUserName(),user.getPhone(),user.getIsActive());
//            ResultSet rs = statement.executeQuery(query);
//            while (rs.next()){
//                int id = rs.getInt("id");
//                setRoleUser(id);
//                return id;
//            }
//            return null;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
        return null;
    }

    @Override
    public Product get(Integer id) {
        return null;
    }

    @Override
    public List<Product> getAll() {
        return List.of();
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
