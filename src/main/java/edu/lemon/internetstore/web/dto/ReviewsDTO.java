package edu.lemon.internetstore.web.dto;

import lombok.Builder;


import java.util.UUID;
@Builder
public record ReviewsDTO(
        UUID reviews_id,
        int rating,
        String comment
//        UserDTO userDTO,
//        ProductsDTO productsDTO
) {
}
