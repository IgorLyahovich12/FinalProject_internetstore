package edu.lemon.internetstore.web.dto;

import edu.lemon.internetstore.model.entity.Product;
import edu.lemon.internetstore.model.entity.User;

import java.time.LocalDate;

public record ShoppingCartDTO(
        Product products,
        User user,
        LocalDate date,
        int quantity
) {}