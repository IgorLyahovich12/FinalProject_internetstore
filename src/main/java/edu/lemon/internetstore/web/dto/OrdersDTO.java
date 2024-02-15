package edu.lemon.internetstore.web.dto;

import lombok.Builder;

import java.time.LocalDate;
import java.util.UUID;
@Builder
public record OrdersDTO(
        UUID order_id,
        String order_status,
//        ProductsDTO productDTO,
        LocalDate order_date
//        UserDTO userDTO
) {
}
