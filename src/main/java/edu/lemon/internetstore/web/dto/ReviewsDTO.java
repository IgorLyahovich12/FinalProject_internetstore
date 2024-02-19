package edu.lemon.internetstore.web.dto;



import edu.lemon.internetstore.model.entity.Product;
import edu.lemon.internetstore.model.entity.User;

import java.util.UUID;

public record ReviewsDTO(
        UUID reviews_id,
        int rating,
        String comment,
        User user,
        Product products
) {}
