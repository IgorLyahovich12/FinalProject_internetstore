package edu.lemon.internetstore.web.dto;


import edu.lemon.internetstore.model.entity.BonusPoints;

import java.time.LocalDate;
import java.util.UUID;

public record UserDTO(
        UUID user_id,
        String name,
        String password,
        String email,
        LocalDate date,
        double total_amount_buy,
        BonusPoints bonusPoints
) {}