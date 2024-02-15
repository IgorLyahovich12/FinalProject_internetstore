package edu.lemon.internetstore.dao;

import edu.lemon.internetstore.model.entity.Provider;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface ProvidersRepository extends JpaRepository<Provider, UUID> {
    @Nonnull
    List<Provider> findAll();
}