package edu.lemon.internetstore.web.dto;


import edu.lemon.internetstore.model.entity.Product;
import edu.lemon.internetstore.model.entity.User;

import java.util.UUID;

public record FavoritesDTO(
        UUID favorites_id,
        User user,
        Product products
) {}
