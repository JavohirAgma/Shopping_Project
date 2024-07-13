package org.example.shoppingproject.service;

import org.example.shoppingproject.model.User;
import org.example.shoppingproject.repository.UserRepository;

import java.util.List;
import java.util.Objects;

public class UserService {

    private UserRepository userRepository;
    public UserService() {
        this.userRepository = new UserRepository();
    }

    public boolean signUp(User user){
        List<User> allForCheck = userRepository.getAllForCheck();
        for (User user1 : allForCheck) {
            if (
             user1.getUserName().equals(user.getUserName())
            || user1.getPassword().equals(user.getPassword())
            || user1.getEmail().equals(user.getEmail())
            || Objects.equals(user1.getPhone(), user.getPhone())
            ){
                return false;
            }
        }
        userRepository.save(user);
        return true;
    }
    public User login(String  username, String password){
        User user = userRepository.login(username,password);
        return user;
    }

    public User get(Integer userId) {
        return userRepository.get(userId);
    }
}