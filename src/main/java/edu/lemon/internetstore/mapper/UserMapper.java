package edu.lemon.internetstore.mapper;


import edu.lemon.internetstore.model.entity.User;
import edu.lemon.internetstore.web.dto.*;

import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public interface UserMapper {
    UserDTO toDto(User user);
    UserDTO userFromDto(User user);


}



