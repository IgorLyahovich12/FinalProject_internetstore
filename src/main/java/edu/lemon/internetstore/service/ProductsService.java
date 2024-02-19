package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.ProductsRepository;
import edu.lemon.internetstore.web.dto.ProductDTO;
import edu.lemon.internetstore.mapper.ProductsMapper;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

    @Service
    public class ProductsService {
        private final ProductsRepository productsRepository;
        private final ProductsMapper productsMapper;

        public ProductsService(ProductsRepository productsRepository, ProductsMapper productsMapper) {
            this.productsRepository = productsRepository;
            this.productsMapper = productsMapper;
        }

        public List<ProductDTO> getProducts() {
            return productsRepository.findAll().stream()
                    .map( productsMapper::toDto)
                    .toList();

        }

        public List<ProductDTO> getProductsPageable(int fromIndex, int quantity) {
            PageRequest pageable = PageRequest.of(fromIndex, quantity);
            return productsRepository
                    .findAll(pageable)
                    .map(productsMapper::toDto)
                    .toList();
        }


    }
