package org.example.shoppingproject.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Image {
    private Integer id;
    private String name;
    private String uuid;
    private String type;
    private Integer productId;
}