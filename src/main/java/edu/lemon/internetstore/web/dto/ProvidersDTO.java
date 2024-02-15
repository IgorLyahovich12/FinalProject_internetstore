package edu.lemon.internetstore.web.dto;

import lombok.Builder;


import java.util.Set;
import java.util.UUID;
@Builder
public record ProvidersDTO (
        UUID provider_id,
        String name_company,
        String country
//        Set<ProductsDTO> products
)
{}
