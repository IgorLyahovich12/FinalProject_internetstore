package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;

import java.util.Set;
import java.util.UUID;

@Setter
@Getter
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "categories")
public final class Categories {

    @Id
    @GeneratedValue
    @Column(name = "categories_id")
    private UUID categories_id;

    @Column(name = "name_categories")
    private String name_categories;

    @Column(name = "description", length = 10000)
    private String description;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(
            name = "product_categories",
            joinColumns = @JoinColumn(name = "categories_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    @BatchSize(size = 20)
    private Set<Product> products;



}
