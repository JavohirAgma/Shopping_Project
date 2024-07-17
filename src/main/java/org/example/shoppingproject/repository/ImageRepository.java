package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.enums.Category;
import org.example.shoppingproject.model.Image;
import org.example.shoppingproject.model.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ImageRepository implements BaseRepository<Image>{
    @Override
    public Integer save(Image image) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "insert into image(name,uuid,type,product_id) values('%s','%s','%s',%s) returning id"
                    .formatted(image.getName(),image.getUuid(),image.getType(),image.getProductId());
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id = rs.getInt("id");
                return id;
            }

            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Image get(Integer id) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from image where id = %s;"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()){
                String name = rs.getString("name");
                String uuid = rs.getString("uuid");
                String type = rs.getString("type");
                int productId = rs.getInt("product_id");
                Image build = Image.builder()
                        .name(name)
                        .type(type)
                        .uuid(uuid)
                        .productId(productId).build();
                return build;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    @Override
    public List<Image> getAll() {
        List<Image> imageList = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from image";
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                String uuid = rs.getString("uuid");
                String type = rs.getString("type");
                String product_id = rs.getString("product_id");
                Image build = Image.builder()
                        .id(id1)
                        .name(name)
                        .type(type)
                        .uuid(uuid)
                        .productId(Integer.parseInt(product_id))
                        .build();
                imageList.add(build);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return imageList;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    public Image getByProductId(Integer productId) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from image where product_id = %s;".formatted(productId);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                String uuid = rs.getString("uuid");
                String type = rs.getString("type");
                String product_id = rs.getString("product_id");
                Image build = Image.builder()
                        .id(id1)
                        .name(name)
                        .type(type)
                        .uuid(uuid)
                        .productId(Integer.parseInt(product_id))
                        .build();
                return build;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }




}