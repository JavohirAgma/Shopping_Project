package org.example.shoppingproject.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Store {
    private Integer id;
    private String name;
    private Integer photoId;
    private Integer ownerId;
    private boolean condition;
}
