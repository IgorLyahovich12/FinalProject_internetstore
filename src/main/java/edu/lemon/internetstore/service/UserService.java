package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.UserRepository;
import edu.lemon.internetstore.model.entity.User;
import edu.lemon.internetstore.web.dto.*;
import edu.lemon.internetstore.mapper.UserMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final UserMapper userMapper;


    public UserService(UserRepository userRepository, UserMapper userMapper) {
        this.userRepository = userRepository;
        this.userMapper = userMapper;
    }

    public List<UserDTO> getAllUsers() {
        List<User> usersPage = userRepository.findAll();
        return usersPage.stream()
                .map(userMapper::userFromDto)
                .collect(Collectors.toList());
    }

    public List<UserDTO> getUserPageable(int fromIndex, int quantity) {
        PageRequest pageable = PageRequest.of(fromIndex, quantity);
        return userRepository
                .findAll(pageable)
                .map(userMapper::toDto)
                .toList();
    }
    }

