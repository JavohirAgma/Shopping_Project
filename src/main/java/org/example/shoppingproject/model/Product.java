package org.example.shoppingproject.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.shoppingproject.enums.Category;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
    private Integer id;
    private String name;
    private String description;
    private String photoId;
    private Integer storeId;
    private boolean isOpen;
    private Integer price;
    private Category category;
    private Integer count;
}
