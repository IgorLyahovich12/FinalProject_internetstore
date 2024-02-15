package edu.lemon.internetstore.web.dto;

import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import  edu.lemon.internetstore.model.entity.*;


import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;
@Builder
public record UserDTO (
        UUID user_id,
//        @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "Name must contain only letters and numbers")
//        @Size(min = 2, max = 50, message = "Name length must be between 2 and 30 characters")
        String name,
//        @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "Password must contain only letters and numbers")
//        @Size(min = 6, max = 20, message = "Password length must be between 6 and 20 characters")
        String password,

//        @Pattern(regexp = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$", message = "Invalid email format")
        String email,
        LocalDate date,
        double total_amount_buy,
//        Set<FavoritesDTO> favorites,
        BonusPoints bonusPoints
//        Set<ReviewsDTO> reviews,
//        Set<OrdersDTO> orders
//       Set<ShoppingCartDTO> shoppingCarts

)
{


}
