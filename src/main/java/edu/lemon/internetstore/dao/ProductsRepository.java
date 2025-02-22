package edu.lemon.internetstore.dao;

import edu.lemon.internetstore.model.entity.Product;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProductsRepository extends JpaRepository<Product, UUID> {
    @Nonnull
    Optional<Product> findById(UUID categories);
    @Nonnull
    List<Product> findAll();
}
