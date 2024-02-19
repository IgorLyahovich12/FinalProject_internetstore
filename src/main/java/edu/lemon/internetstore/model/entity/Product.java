package edu.lemon.internetstore.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@Table(name = "product")
public final class Product {
    @Id
    @GeneratedValue
    @Column(name = "product_id")
    private UUID product_id;

    @Column(name = "name_product")
    private String name_product;

    @Column(name = "description", length = 10000)
    private String description;

    @Column(name = "price")
    private double price;

    @Column(name = "stock_quantity")
    private int stock_quantity;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "products")
    @BatchSize(size = 20)

    private Set<Provider> providers;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "products")
    @BatchSize(size = 20)

    private Set<Categories> categories;
}
