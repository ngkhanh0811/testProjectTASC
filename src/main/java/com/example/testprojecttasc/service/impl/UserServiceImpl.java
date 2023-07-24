package com.example.testprojecttasc.service.impl;

import com.example.testprojecttasc.dto.UserDto;
import com.example.testprojecttasc.entity.User;
import com.example.testprojecttasc.exception.BusinessException;
import com.example.testprojecttasc.mapper.UserMapper;
import com.example.testprojecttasc.repository.UserRepository;
import com.example.testprojecttasc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRepository repo;

    @Override
    public List<UserDto> gets(UserDto criteria) {
        Pageable pageable = PageRequest.of(criteria.getPageNumber(), criteria.getPageSize());
        Page<User> userList = repo.findAll(pageable);
        return userList.getContent().stream().map(userMapper::entityToDto).collect(Collectors.toList());
    }

    @Override
    public UserDto getById(Long id) {
        if (repo.existsById(id)) {
            return userMapper.entityToDto(repo.getById(id));
        } else{
            throw new BusinessException("201", "Invalid data");
        }
    }

    @Override
    public UserDto save(UserDto userDto) {
        User user = userMapper.dtoToEntity(userDto);
        if (Objects.isNull(user)){
            return null;
        } else{
            User returnEntity = repo.save(user);
            return userMapper.entityToDto(returnEntity);
        }
    }

    @Override
    public UserDto createNewItem(UserDto userDto) {
        //todo: validate
        User user = userMapper.dtoToEntity(userDto);
        return userMapper.entityToDto(repo.save(user));
    }

    @Override
    public void delete(Long id) {
        List<User> users = repo.findAll();
        for (User user: users){
            if (user.getId() == id){
                repo.deleteById(id);
            }
        }
    }

    @Override
    public List<User> searchByName(String name) {
        List<User> userList = repo.findByName(name);
        return userList;
    }
}
