package edu.lemon.internetstore.mapper;


import edu.lemon.internetstore.model.entity.Reviews;
import edu.lemon.internetstore.web.dto.*;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public interface ReviewsMapper {
   ReviewsDTO toDto(Reviews reviews);
}

