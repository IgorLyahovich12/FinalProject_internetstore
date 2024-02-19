package edu.lemon.internetstore.web.dto;


import edu.lemon.internetstore.model.entity.Product;
import edu.lemon.internetstore.model.entity.User;

import java.time.LocalDate;
import java.util.UUID;

public record OrdersDTO(
        UUID order_id,
        String order_status,
        Product product,
        LocalDate order_date,
        User user
) {}
