package org.example.shoppingproject.service;

import org.example.shoppingproject.model.User;
import org.example.shoppingproject.repository.UserRepository;

public class UserService {

    private UserRepository userRepository;
    public UserService() {
        this.userRepository = new UserRepository();
    }

    public void signUp(User user){
        userRepository.save(user);
    }
    public User login(String  username, String password){
        User user = userRepository.login(username,password);
        return user;
    }

    public User get(Integer userId) {
        return userRepository.get(userId);
    }
}