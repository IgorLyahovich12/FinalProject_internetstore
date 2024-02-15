package edu.lemon.internetstore.dao;

import edu.lemon.internetstore.model.entity.Orders;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;
@Repository
public interface OrdersRepository extends JpaRepository<Orders, UUID> {
    @Nonnull
    List<Orders> findAll();
}
