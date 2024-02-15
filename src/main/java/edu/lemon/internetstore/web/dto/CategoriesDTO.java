package edu.lemon.internetstore.web.dto;
import lombok.Builder;



import java.util.Set;
import java.util.UUID;

@Builder
public record CategoriesDTO (

        UUID uuid,
        String name_categories,
        String description
//        Set<ProductsDTO> productsDTO
)
{}
