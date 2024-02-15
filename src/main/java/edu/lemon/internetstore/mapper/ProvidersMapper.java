package edu.lemon.internetstore.mapper;


import edu.lemon.internetstore.model.entity.Provider;
import edu.lemon.internetstore.web.dto.*;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public interface ProvidersMapper {
    ProvidersDTO toDto(Provider provider);
}
