package edu.lemon.internetstore.mapper;


import edu.lemon.internetstore.model.entity.Product;
import edu.lemon.internetstore.web.dto.*;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public interface ProductsMapper {
    ProductDTO toDto(Product product);

    Product fromDto(ProductDTO productDto);
}