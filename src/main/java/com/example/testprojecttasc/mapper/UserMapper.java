package com.example.testprojecttasc.mapper;

import com.example.testprojecttasc.dto.UserDto;
import com.example.testprojecttasc.entity.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserMapper {
    UserDto entityToDto(User user);
    User dtoToEntity(UserDto userDto);
}
