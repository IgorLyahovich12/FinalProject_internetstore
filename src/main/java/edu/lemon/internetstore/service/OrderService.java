package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.OrdersRepository;
import edu.lemon.internetstore.web.dto.OrdersDTO;
import edu.lemon.internetstore.mapper.OrdersMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    private final OrdersRepository ordersRepository;
    private final OrdersMapper ordersMapper;

    public OrderService(OrdersRepository ordersRepository, OrdersMapper ordersMapper) {
        this.ordersRepository = ordersRepository;
        this.ordersMapper = ordersMapper;
    }

    public List<OrdersDTO> getOrders() {
        return ordersRepository.findAll().stream()
                .map(ordersMapper::toDto)
                .toList();
    }
}
