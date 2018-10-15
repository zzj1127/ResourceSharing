package com.zzj.course.service;

import com.zzj.course.model.User;

public interface UserService {
    //登录
    public User userLogin(User user);
    //注册
    public void register(User user);
    //查询名字
    public  User findUserByName(String username);
    //通过id查询信息
    public User userSelectById(String userId);
    //修改信息
    public void changeInformation(User user);

    //修改密码
   public void resetpassword(User user);
}
