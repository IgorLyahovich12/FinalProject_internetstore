//package edu.lemon.internetstore.web.rest;
//
//import edu.lemon.internetstore.web.dto.ReviewsDTO;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/api/v1/reviews")
//public class ReviewsApiService {
//    private final ReviewsService reviewsService;
//
//
//
//    public ReviewsApiService(ReviewsService reviewsService) {
//        this.reviewsService = reviewsService;
//    }
//
//    @GetMapping
//    public ResponseEntity<List<ReviewsDTO>> getReviews() {
//        return ResponseEntity.ok(reviewsService.getReviewsService());
//    }
//}

