package edu.lemon.internetstore.web.controller;

import edu.lemon.internetstore.service.ProductsService;
import edu.lemon.internetstore.web.dto.ProductsDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/products")
public class ProductsController {

    private final ProductsService productsService;

    public ProductsController(ProductsService productsService) {
        this.productsService = productsService;
    }

    @GetMapping
    public ModelAndView getAllProducts() {
        return new ModelAndView(
                "/pages/products",
                new ModelMap()
                        .addAttribute("products", productsService.getProducts())
                        .addAttribute("productType", ProductsDTO.getEmptyProductObject())
        );
    }

    @PostMapping(path = "/add-product", consumes = "application/x-www-form-urlencoded")
    public RedirectView createProduct(ProductsDTO productDto) {
        productsService.createProduct(productDto);
        return new RedirectView("/products");
    }
}
