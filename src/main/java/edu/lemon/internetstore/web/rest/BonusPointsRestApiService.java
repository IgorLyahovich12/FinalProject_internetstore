package edu.lemon.internetstore.web.rest;
import edu.lemon.internetstore.web.dto.BonusPointsDTO;

import edu.lemon.internetstore.service.BonusPointsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/BonusPoints")
public class BonusPointsRestApiService {
    private final BonusPointsService bonusPointsService;


    public BonusPointsRestApiService(BonusPointsService bonusPointsService) {
        this.bonusPointsService = bonusPointsService;

    }
    @GetMapping
    public ResponseEntity<List<BonusPointsDTO>> getOrders() {
        return ResponseEntity.ok(bonusPointsService.getBonusPoints());
    }
}
