
package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.BatchSize;

import java.util.UUID;


@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "favorites")
public final class Favorites {
    @Id
    @GeneratedValue
    @Column(name = "favorites_id")
    private UUID favorites_id;

//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinColumn(name = "user_id")
//    @BatchSize(size = 20)
//    private User user;
//
//    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinColumn(name = "product_id")
//    @BatchSize(size = 20)
//    private Product product;


}