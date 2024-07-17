package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.enums.Category;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.model.Store;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements BaseRepository<Product>{
    @Override
    public Integer save(Product product) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "insert into products(name,description,photoId,isOpen,category,store_id,price) values('%s','%s','%s',%s,'%s',%s,%s) returning id;"
                    .formatted(product.getName(),product.getDescription(),product.getPhotoId(),true,product.getCategory(),product.getStoreId(),product.getPrice());
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id = rs.getInt("id");
                return id;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public Product get(Integer id) {

        return null;
    }

  @Override
    public List<Product> getAll() {

        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from products where isOpen=true";
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int id = rs.getInt("store_id");
                int price = rs.getInt("price");
                String name = rs.getString("name");
                String category = rs.getString("category");
                String description = rs.getString("description");
                String photoId = rs.getString("photoId");
                Boolean isOpen = rs.getBoolean("isOpen");
                Product build = Product.builder()
                        .photoId(photoId)
                        .name(name)
                        .description(description)
                        .isOpen(isOpen)
                        .id(id1)
                        .storeId(id)
                        .category(Category.valueOf(category))
                        .price(price)
                        .build();
                productList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;

    }


    public List<Product> getAll(Integer id) {
        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from products where store_id = %s"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int price = rs.getInt("price");
                String name = rs.getString("name");
                String category = rs.getString("category");
                String description = rs.getString("description");
                String photoId = rs.getString("photoId");
                Boolean isOpen = rs.getBoolean("isOpen");
                Product build = Product.builder()
                        .photoId(photoId)
                        .name(name)
                        .description(description)
                        .isOpen(isOpen)
                        .id(id1)
                        .storeId(id)
                        .category(Category.valueOf(category))
                        .price(price)
                        .build();
                productList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
