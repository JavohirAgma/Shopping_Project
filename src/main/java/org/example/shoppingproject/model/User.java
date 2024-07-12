package org.example.shoppingproject.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.shoppingproject.enums.UserRole;

import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    private Integer id;
    private String name;
    private String userName;
    private String password;
    private String email;
    private String phone;
    private List<UserRole> role;
    private Boolean isActive;
}
