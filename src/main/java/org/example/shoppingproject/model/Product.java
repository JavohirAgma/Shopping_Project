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
    private Integer photoId;
    private boolean isOpen;
    private Category category;
}
