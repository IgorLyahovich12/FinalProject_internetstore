package edu.lemon.internetstore.web.dto;





import lombok.Builder;

import java.util.UUID;

@Builder
public record CategoriesDTO (

        UUID categories_id,
        String name_categories,
        String description

)
{}
