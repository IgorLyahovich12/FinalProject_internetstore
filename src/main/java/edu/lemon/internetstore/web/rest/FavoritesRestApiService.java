package edu.lemon.internetstore.web.rest;
import edu.lemon.internetstore.web.dto.FavoritesDTO;
import edu.lemon.internetstore.service.FavoritesService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/favorites")
public class FavoritesRestApiService {
    private final FavoritesService favoritesService;

    public FavoritesRestApiService(FavoritesService favoritesService) {
        this.favoritesService = favoritesService;
    }
    @GetMapping
    public ResponseEntity<List<FavoritesDTO>> getOrders() {
        return ResponseEntity.ok(favoritesService.getFavorites());
    }
}

