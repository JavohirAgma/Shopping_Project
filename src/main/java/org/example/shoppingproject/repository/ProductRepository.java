package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.enums.Category;
import org.example.shoppingproject.model.Product;

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
            String query = "insert into products(name,description,photoId,isOpen,category,store_id,price,count) values('%s','%s','%s',%s,'%s',%s,%s,%s) returning id;"
                    .formatted(product.getName(),product.getDescription(),product.getPhotoId(),true,product.getCategory(),product.getStoreId(),product.getPrice(),product.getCount());
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
            String query = "select * from products";
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int id = rs.getInt("store_id");
                int price = rs.getInt("price");
                int count = rs.getInt("count");
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
                        .count(count)
                        .build();
                productList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
    public List<Product> getAllIsActive() {
        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from products where isOpen=true and count!=0";
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int id = rs.getInt("store_id");
                int price = rs.getInt("price");
                int count = rs.getInt("count");
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
                        .count(count)
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


    public List<Product> getAll(Integer id) {
        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from products where store_id = %s and isOpen=%s"
                    .formatted(id,true);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int price = rs.getInt("price");
                int count = rs.getInt("count");
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
                        .count(count)
                        .build();
                productList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
    public Product getProductById(Integer id) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from products where id = %s limit 1"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int price = rs.getInt("price");
                int count = rs.getInt("count");
                int store_id = rs.getInt("store_id");
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
                        .storeId(store_id)
                        .category(Category.valueOf(category))
                        .price(price)
                        .count(count)
                        .build();
                return build;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean updateCountDec(Integer productId, Integer count) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "update products set count = count - %s where id = %s"
                    .formatted(count,productId);
            int i = statement.executeUpdate(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean updateCountInc(Integer productId, Integer count) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "update products set count = count + %s where id = %s"
                    .formatted(count,productId);
            int i = statement.executeUpdate(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public String findName(Integer id) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){

            String query = "select name from products where id = %s"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                String name = rs.getString("name");
                return name;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean setIsOpen(Integer id, boolean open){
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "update products set isOpen = %s where id = %s".formatted(open,id);
            statement.execute(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
