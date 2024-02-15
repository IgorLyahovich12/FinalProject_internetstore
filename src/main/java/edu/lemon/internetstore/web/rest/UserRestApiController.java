package edu.lemon.internetstore.web.rest;

import edu.lemon.internetstore.web.dto.*;
import edu.lemon.internetstore.service.UserService;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/api/v1/user")
public class UserRestApiController {
    private final UserService userService;

    public UserRestApiController(UserService userService) {
        this.userService = userService;
    }

    // Отримати всіх користувачів через REST API
    @GetMapping("/all")
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserDTO> users = userService.getAllUsers();
        return ResponseEntity.ok(users);
    }

    @GetMapping("/{from}/{quantity}")
    public ResponseEntity<List<UserDTO>> getUsers(
            @PathVariable(value = "from", required = false) int from,
            @PathVariable(value = "quantity", required = false) int quantity) {
        return ResponseEntity.ok(userService.getUserPageable(from, quantity));
    }
//
//    @GetMapping("/withAmountOf/Reviews")
//    public ResponseEntity<List<UserDTO>> getUsersByAmountOfReviews() {
//        List<UserDTO> users = userService.getUsersByAmountOfReviews();
//        return ResponseEntity.ok(users);
//    }
//    @GetMapping("/withAmountOf/ShoppingCarts")
//    public ResponseEntity<List<UserDTO>> getUsersByAmountOfShoppingCarts() {
//        List<UserDTO> users = userService.getUsersByAmountOfShoppingCarts();
//        return ResponseEntity.ok(users);
//    }
//    @GetMapping("/withAmountOf/Orders")
//    public ResponseEntity<List<UserDTO>> getUsersByAmountOfOrders() {
//        List<UserDTO> users = userService.getUsersByAmountOfOrders();
//        return ResponseEntity.ok(users);
//    }
//    @GetMapping("/{userId}")
//    public ResponseEntity<UserDTO> getUserById(@PathVariable UUID userId) {
//        UserDTO user = userService.getUserById(userId);
//        return ResponseEntity.ok(user);
//    }
//    @GetMapping("/withAmountOf/Favorites")
//    public ResponseEntity<List<UserDTO>> getUsersByAmountOfFavorites() {
//        List<UserDTO> users = userService.getUsersByAmountOfFavorites();
//        return ResponseEntity.ok(users);
//    }
//    @GetMapping("/withShoppingCarts")
//    public ResponseEntity<List<ShoppingCartDTO>> getUsersWithShoppingCarts() {
//        List<ShoppingCartDTO> shoppingCarts = userService.getUsersWithShoppingCarts();
//        return ResponseEntity.ok(shoppingCarts);
//    }
//
//    @GetMapping("/withReviews")
//    public ResponseEntity<List<ReviewsDTO>> getUsersWithReviews() {
//        List<ReviewsDTO> reviews = userService.getUsersWithReviews();
//        return ResponseEntity.ok(reviews);
//    }
//
//    @GetMapping("/withFavorites")
//    public ResponseEntity<List<FavoritesDTO>> getUsersWithFavorites() {
//        List<FavoritesDTO> favorites = userService.getUsersWithFavorites();
//        return ResponseEntity.ok(favorites);
//    }
//
//    @GetMapping("/withOrders")
//    public ResponseEntity<List<OrdersDTO>> getUsersWithOrders() {
//        List<OrdersDTO> orders = userService.getUsersWithOrders();
//        return ResponseEntity.ok(orders);
//    }
//
//    @GetMapping("/withBonusPoints")
//    public ResponseEntity<List<BonusPointsDTO>> getUsersWithBonusPoints() {
//        List<BonusPointsDTO> bonusPoints = userService.getUsersWithBonusPoints();
//        return ResponseEntity.ok(bonusPoints);
//    }

}
