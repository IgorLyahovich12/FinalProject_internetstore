package edu.lemon.internetstore.web.rest;
import edu.lemon.internetstore.web.dto.CategoriesDTO;
import edu.lemon.internetstore.service.CategoriesService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/categories")
public class CategoriesRestApiService {
    private final CategoriesService categoriesService;

    public CategoriesRestApiService(CategoriesService categoriesService) {
        this.categoriesService = categoriesService;
    }
    @GetMapping
    public ResponseEntity<List<CategoriesDTO>> getCategories() {
        return ResponseEntity.ok(categoriesService.getCategories());
    }


}
