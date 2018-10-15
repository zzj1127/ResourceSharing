package com.zzj.course.service.impl;

import com.zzj.course.dao.UserMapper;
import com.zzj.course.model.User;
import com.zzj.course.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public User userLogin(User user){
            return userMapper.userLogin(user);
    }
    @Override
    public void register(User user){
           userMapper.register(user);
    }
    @Override
    public User findUserByName(String username){
         return  userMapper.findUserByName(username);
    }
    @Override
    public  User userSelectById(String userId){
        return userMapper.userSelectById(userId);
    }
    @Override
    public void changeInformation(User user){
        userMapper.changeInformation(user);
    }
    @Override
    public void resetpassword(User user){
        userMapper.resetpassword(user) ;
    }

}
