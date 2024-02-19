package edu.lemon.internetstore.web.dto;

import lombok.Builder;
import java.util.UUID;
import java.util.Set;

@Builder
public record ProductDTO(
        UUID product_id,
        String name_product,
        String description,
        double price,
        int stock_quantity,
        Set<ProvidersDTO> providers,
        Set<CategoriesDTO> categories
) {
    public static ProductDTO getEmptyProductObject() {
        return ProductDTO.builder().build();
    }
}




