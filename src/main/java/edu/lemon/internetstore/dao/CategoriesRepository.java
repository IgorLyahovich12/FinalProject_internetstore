package edu.lemon.internetstore.dao;


import edu.lemon.internetstore.model.entity.Categories;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface CategoriesRepository extends JpaRepository<Categories, UUID> {
    @Nonnull
    List<Categories> findAll();
}
