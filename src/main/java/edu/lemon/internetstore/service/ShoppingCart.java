package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.ShoppingCartRepository;
import edu.lemon.internetstore.mapper.ShoppingCartMapper;

public class ShoppingCart {
    private final ShoppingCartRepository shoppingCartRepositoryRepository;
    private final ShoppingCartMapper shoppingCartMapperMapper;

    public ShoppingCart(ShoppingCartRepository shoppingCartRepositoryRepository, ShoppingCartMapper shoppingCartMapperMapper) {
        this.shoppingCartRepositoryRepository = shoppingCartRepositoryRepository;
        this.shoppingCartMapperMapper = shoppingCartMapperMapper;
    }
}
