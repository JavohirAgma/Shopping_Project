package org.example.shoppingproject.repository;

import org.example.shoppingproject.config.DbConnection;
import org.example.shoppingproject.enums.UserRole;
import org.example.shoppingproject.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements BaseRepository<User>{
    @Override
    public Integer save(User user) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "insert into users(name,gmail,password,username,phone_number,is_active) values('%s','%s','%s','%s','%s',%s) returning id;"
                    .formatted(user.getName(),user.getEmail(),user.getPassword(),user.getUserName(),user.getPhone(),true);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id = rs.getInt("id");
                setRoleUser(id);
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
                String email = rs.getString("gmail");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String phoneNumber = rs.getString("phone_number");
                Boolean isActive = rs.getBoolean("is_active");
                List<Integer> role = getRole(id1);
                List<UserRole> role2= new ArrayList<>();
                for (Integer i : role) {
                    UserRole category = UserRole.getCategoryByOrdinal(i);
                    role2.add(category);
                }
                User build = User.builder()
                        .id(id1)
                        .name(name)
                        .password(password)
                        .isActive(isActive)
                        .phone(phoneNumber)
                        .email(email)
                        .userName(username)
                        .role(role2)
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
        return List.of();
    }


    public List<User> getAll(Integer id) {
        List<User> users = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from users where id!=%s"
                    .formatted(id);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("gmail");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String phoneNumber = rs.getString("phone_number");
                Boolean isActive = rs.getBoolean("is_active");
                List<Integer> role = getRole(id1);
                List<UserRole> role2= new ArrayList<>();
                for (Integer i : role) {
                    UserRole category = UserRole.getCategoryByOrdinal(i);
                    role2.add(category);
                }
                User build = User.builder()
                        .id(id1)
                        .name(name)
                        .password(password)
                        .isActive(isActive)
                        .phone(phoneNumber)
                        .email(email)
                        .userName(username)
                        .role(role2)
                        .build();
                users.add(build);
            }
            return users;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
            String query = "select * from users where username = '%s' and password = '%s' and is_active=%s  limit 1"
                    .formatted(username,password,true);
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()){
                int id1 = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("gmail");
                String username2 = rs.getString("username");
                String password2= rs.getString("password");
                String phoneNumber = rs.getString("phone_number");
                Boolean isActive = rs.getBoolean("is_active");
                List<Integer> role = getRole(id1);
                List<UserRole> roles = new ArrayList<>();
                for (Integer i : role) {
                    UserRole categoryByOrdinal = UserRole.getCategoryByOrdinal(i);
                    roles.add(categoryByOrdinal);
                }
                User user = User.builder()
                        .id(id1)
                        .name(name)
                        .password(password2)
                        .isActive(isActive)
                        .phone(phoneNumber)
                        .email(email)
                        .role(roles)
                        .userName(username2)
                        .build();
                return user;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public List<User> getAllForCheck() {
        List<User> users = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select * from users ";
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("gmail");
                String username2 = rs.getString("username");
                String password2 = rs.getString("password");
                String phoneNumber = rs.getString("phone_number");
                User user = User.builder()
                        .name(name)
                        .email(email)
                        .userName(username2)
                        .password(password2)
                        .phone(phoneNumber)
                        .build();
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }


    public boolean setRoleCeller(Integer user_id) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "insert into connection_role(user_id,role_id) values(%s,2)" .formatted(user_id);
            statement.execute(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean setRoleUser(Integer user_id) {
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "insert into connection_role(user_id,role_id) values(%s,1)" .formatted(user_id);
            statement.execute(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Integer> getRole(Integer id) {
        List<Integer> roles = new ArrayList<>();
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "select role_id from connection_role where user_id = %s" .formatted(id);
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int roleId = rs.getInt("role_id");
                roles.add(roleId);
            }
            return roles;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean setIsActive(Integer id, boolean active){
        try (
                Connection connection = DbConnection.getConnection();
                Statement statement = connection.createStatement();
        ){
            String query = "update users set is_active = %s where id = %s".formatted(active,id);
            statement.execute(query);
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
