package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class UserRepository implements BaseRepository<User>{
    @Override
    public Integer save(User user) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "insert into users(name,gmail,password,username,phone_number,is_active) values('%s','%s','%s','%s','%s',%s) returning id;"
                    .formatted(user.getName(),user.getEmail(),user.getPassword(),user.getUserName(),user.getPhone(),user.getIsActive());
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
    public User get(Integer id) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from users where id = %s limit 1"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String phoneNumber = rs.getString("phone_number");
                Boolean isActive = rs.getBoolean("is_active");
                User build = User.builder()
                        .id(id1)
                        .name(name)
                        .password(password)
                        .isActive(isActive)
                        .phone(phoneNumber)
                        .email(email)
                        .userName(username)
                        .build();
                return build;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    public User login(String username, String password) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from users where username = '%s' and password = '%s' limit 1"
                    .formatted(username,password);
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String username2 = rs.getString("username");
                String password2= rs.getString("password");
                String phoneNumber = rs.getString("phone_number");
                Boolean isActive = rs.getBoolean("is_active");
                User user = User.builder()
                        .id(id1)
                        .name(name)
                        .password(password2)
                        .isActive(isActive)
                        .phone(phoneNumber)
                        .email(email)
                        .userName(username2)
                        .build();
                return user;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
