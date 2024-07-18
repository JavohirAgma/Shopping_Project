package org.example.shoppingproject.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Basket {
    private Integer id;
    private Integer userId;
    private Integer productId;
    private Integer storeId;
    private Integer countOfProduct;
    private Integer productSum;
    private boolean isactive;
}
