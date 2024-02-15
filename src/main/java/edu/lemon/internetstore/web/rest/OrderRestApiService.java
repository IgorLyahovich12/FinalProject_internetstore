package edu.lemon.internetstore.web.rest;
import edu.lemon.internetstore.web.dto.OrdersDTO;
import edu.lemon.internetstore.service.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/orders")
public class OrderRestApiService {
    private final OrderService orderService;

    public OrderRestApiService(OrderService orderService) {
        this.orderService = orderService;
    }
    @GetMapping
    public ResponseEntity<List<OrdersDTO>> getOrders() {
        return ResponseEntity.ok(orderService.getOrders());
    }
}
