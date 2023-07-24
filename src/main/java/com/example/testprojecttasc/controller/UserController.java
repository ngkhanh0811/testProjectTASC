package com.example.testprojecttasc.controller;

import com.example.testprojecttasc.dto.UserDto;
import com.example.testprojecttasc.entity.User;
import com.example.testprojecttasc.repository.UserRepository;
import com.example.testprojecttasc.service.UserService;
import org.apache.tomcat.jni.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
public class UserController extends BaseController {
    @Autowired
    private UserService service;
    @Autowired
    private UserRepository repo;

    //List all users and search by name
    @GetMapping(value = "users")
    public ModelAndView gets(@RequestParam(required = false) String searchString, HttpServletRequest request){
        UserDto criteria = new UserDto();
        List<User> users = repo.findAll();
        int count = users.size();
        criteria.setPageSize(commonProperties.getDefaultPageSize());
        criteria.setPageNumber(commonProperties.getDefaultPageNumber());
        ModelAndView view = new ModelAndView("pages/list.jsp");
        view.addObject("count", count);
        if (searchString == null || searchString.trim().isEmpty()){
            List<UserDto> userDtoList = service.gets(criteria);
            view.addObject("users", userDtoList);
            System.out.println(userDtoList);
            return view;
        } else{
            List<User> userList = service.searchByName(searchString);
            view.addObject("users",userList);
            System.out.println(userList);
        }



        return view;
    }

    //Get details of user
    @GetMapping(value = "user")
    public ModelAndView getDetails(@RequestParam Long id, HttpServletRequest request){
        ModelAndView view = new ModelAndView("pages/details.jsp");
        UserDto userDto = service.getById(id);
        view.addObject("user", userDto);
        return view;
    }

    //Update user
    @GetMapping(value = "users/update")
    public UserDto updateUser(@RequestParam Long id, HttpServletRequest request){
        UserDto userDto1 = service.getById(id);
        return userDto1;
    }

    //Detele user
    @RequestMapping(value = "users/delete")
    public String deleteId(@RequestParam Long id, HttpServletRequest request){
        if (id!= null){
            service.delete(id);
            return "redirect:/users";
        } else{
            return "redirect:/users";
        }
    }


    //Get create form
//    @GetMapping(value = "users/create")
//    public ModelAndView getCreateView(HttpServletRequest request){
//        UserDto userDto = new UserDto();
//        ModelAndView view = new ModelAndView("pages/createForm.jsp");
//        view.addObject("userCreate", userDto);
//        return view;
//    }

    //Post data from create form
    @PostMapping(value = "users/create")
    public String createNewItem(@ModelAttribute UserDto userDto, @RequestParam(required = false) Long id, HttpServletRequest request){
        //todo: validate
        List<UserDto> userDtoList = new ArrayList<>();
        userDtoList.forEach(item -> {
            if (item.getId() != id){
                service.save(userDto);
            } else if (item.getId() == id){
                UserDto userDto1 = service.getById(id);
                service.save(userDto1);
            }
        });
        return "redirect:/users";
    }
}
