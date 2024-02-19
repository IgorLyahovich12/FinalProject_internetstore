package edu.lemon.internetstore.model.entity;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCartId implements Serializable {
    private Product products;
    private User user;
}
