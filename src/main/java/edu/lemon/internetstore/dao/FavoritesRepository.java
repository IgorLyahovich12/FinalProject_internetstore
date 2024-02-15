package edu.lemon.internetstore.dao;

import edu.lemon.internetstore.model.entity.Favorites;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface FavoritesRepository extends JpaRepository<Favorites, UUID> {
    @Nonnull
    List<Favorites> findAll();
}
