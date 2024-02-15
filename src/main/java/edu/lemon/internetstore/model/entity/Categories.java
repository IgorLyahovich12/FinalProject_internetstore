package edu.lemon.internetstore.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.BatchSize;

import java.util.Set;
import java.util.UUID;

@Data
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
    private String nameCategories;

    @Column(name = "description", length = 10000)
    private String description;

//    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinTable(
//            name = "Product_Categories",
//            joinColumns = @JoinColumn(name = "categories_id"),
//            inverseJoinColumns = @JoinColumn(name = "product_id")
//    )
//    @BatchSize(size = 20)
//    private Set<Product> products;
}
