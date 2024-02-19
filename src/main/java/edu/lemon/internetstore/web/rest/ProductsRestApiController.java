package edu.lemon.internetstore.web.rest;

import edu.lemon.internetstore.service.ProductsService;


import edu.lemon.internetstore.web.dto.ProductDTO;
import edu.lemon.internetstore.web.dto.UserDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
public class ProductsRestApiController {

        private final ProductsService productsService;

        public ProductsRestApiController(ProductsService productsService) {
            this.productsService = productsService;
        }

        @GetMapping
        public ResponseEntity<List<ProductDTO>> getProducts() {
            List<ProductDTO> products = productsService.getProducts();
            return ResponseEntity.ok(products);
        }

    }
