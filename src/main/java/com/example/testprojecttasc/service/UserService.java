package com.example.testprojecttasc.service;


import com.example.testprojecttasc.dto.UserDto;
import com.example.testprojecttasc.entity.User;

import java.util.List;

public interface UserService {
    List<UserDto> gets(UserDto criteria);
    UserDto getById(Long id);
    UserDto save(UserDto user);
    UserDto createNewItem(UserDto userDto);
    void delete(Long id);
    List<User> searchByName(String name);
}
