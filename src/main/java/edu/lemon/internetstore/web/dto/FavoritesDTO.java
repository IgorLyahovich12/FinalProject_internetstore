package edu.lemon.internetstore.web.dto;

import lombok.Builder;


import java.util.UUID;
@Builder
public record FavoritesDTO(
        UUID favorites_id
//        UserDTO userDTO,
//        ProductsDTO productDTO
) {
}
