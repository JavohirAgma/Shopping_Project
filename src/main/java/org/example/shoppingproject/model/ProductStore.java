package org.example.shoppingproject.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductStore {
    private Integer id;
    private Integer productId;
    private Integer storeId;
    private Integer CountOfProduct;
    private Integer SumOfProduct;
}
