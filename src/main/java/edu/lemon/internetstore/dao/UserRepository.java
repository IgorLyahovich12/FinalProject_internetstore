package edu.lemon.internetstore.dao;

import edu.lemon.internetstore.model.entity.User;
import jakarta.annotation.Nonnull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
    @Nonnull
    Optional<User> findById(@Nonnull UUID categories_id);
    @Nonnull
    List<User> findAll();
}
