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
@Table(name = "reviews")
public final class Reviews {
    @Id
    @GeneratedValue
    @Column(name = "reviews_id")
    private UUID reviews_id;

    @Column(name = "rating")
    private int rating;

    @Column(name = "comment")
    private String comment;

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