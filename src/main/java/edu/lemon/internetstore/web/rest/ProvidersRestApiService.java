package edu.lemon.internetstore.web.rest;
import edu.lemon.internetstore.web.dto.ProvidersDTO;
import edu.lemon.internetstore.service.ProvidersService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/providers")
public class ProvidersRestApiService {
    private final ProvidersService providersService;

    public ProvidersRestApiService(ProvidersService providersService) {
        this.providersService = providersService;
    }
    @GetMapping
    public ResponseEntity<List<ProvidersDTO>> getProducts() {
        return ResponseEntity.ok(providersService.getProvidersService());
    }
}
