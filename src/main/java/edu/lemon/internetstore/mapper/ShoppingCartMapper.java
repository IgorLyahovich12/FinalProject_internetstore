package edu.lemon.internetstore.mapper;
import edu.lemon.internetstore.model.entity.ShoppingCart;

import edu.lemon.internetstore.web.dto.ShoppingCartDTO;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public interface ShoppingCartMapper {

    ShoppingCartDTO ShoppingCartToShoppingCartDTO(ShoppingCart shoppingCart);
}
