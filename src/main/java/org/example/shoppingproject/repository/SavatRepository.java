package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.model.Basket;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SavatRepository implements BaseRepository<Basket>{
    @Override
    public Integer save(Basket basket) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query1="select * from savat where product_id=%s".formatted(basket.getProductId());
            ResultSet resultSet = statement.executeQuery(query1);
            if(resultSet.next()){
                String query2 = "update savat set count_product = count_product + %s where product_id = %s".formatted(basket.getCountOfProduct(),basket.getProductId());
                int i = statement.executeUpdate(query2);
                return i;
            }else{
                String query = "insert into savat(store_id,product_id,user_id,count_product,sum_product,is_active) values(%s,%s,%s,%s,%s,%s) returning id;"
                        .formatted(basket.getStoreId(),basket.getProductId(),basket.getUserId(),basket.getCountOfProduct(),basket.getProductSum(),true);
                ResultSet rs = statement.executeQuery(query);
                while (rs.next()){
                    int id = rs.getInt("id");
                    return id;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public Basket get(Integer userId) {
        return null;
    }
    @Override
    public List<Basket> getAll() {
        return null;
    }


    public List<Basket> getAll(Integer userId) {
        List<Basket> basketList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from savat where user_id = %s and is_active = %s"
                    .formatted(userId,true);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                int store_id = rs.getInt("store_id");
                int productId = rs.getInt("product_id");
                int user_id = rs.getInt("user_id");
                int count_product = rs.getInt("count_product");
                int sum_product = rs.getInt("sum_product");
                Boolean isActive = rs.getBoolean("is_active");
                Basket build = Basket.builder()
                        .id(id1)
                        .storeId(store_id)
                        .productId(productId)
                        .userId(user_id)
                        .countOfProduct(count_product)
                        .productSum(sum_product)
                        .isactive(isActive)
                        .build();
                basketList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return basketList;
    }

    @Override
    public boolean delete(Integer productId) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "delete from savat where product_id = %s"
                    .formatted(productId);
            int i = statement.executeUpdate(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public Integer Payment(Integer userId) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "delete from savat where user_id = %s"
                    .formatted(userId);
            int i = statement.executeUpdate(query);
            return i;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
