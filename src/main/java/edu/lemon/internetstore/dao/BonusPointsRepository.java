package edu.lemon.internetstore.dao;
import edu.lemon.internetstore.model.entity.BonusPoints;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface BonusPointsRepository extends JpaRepository<BonusPoints, UUID> {
    @Nonnull
    List<BonusPoints> findAll();
}