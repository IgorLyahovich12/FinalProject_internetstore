package edu.lemon.internetstore.web.dto;

import lombok.Builder;



import java.util.Set;
import java.util.UUID;

@Builder
public record ProductsDTO(
        UUID product_id,
        String name_product,
        String description,
        double price,
        int stock_quality
//        Set<ProvidersDTO> providers,
//        Set<CategoriesDTO> categories
//        Set<ReviewsDTO> reviews,
//        Set<FavoritesDTO> favorites
//       Set<ShoppingCartDTO> shoppingCarts


) {
    public static ProductsDTO getEmptyProductObject() {
        return ProductsDTO.builder().build();

    }
}